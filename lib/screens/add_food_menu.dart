import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fastfood/utility/my_constant.dart';
import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddFoodMenu extends StatefulWidget {
  @override
  _AddFoodMenuState createState() => _AddFoodMenuState();
}

class _AddFoodMenuState extends State<AddFoodMenu> {
  //Field
  File file;
  String nameFood, price, detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເພີ່ມລາຍການອາຫານ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showTitleFood('ຮູບອາຫານ'),
            groupImage(),
            showTitleDetailFood('ລາຍລະອຽດອາຫານ'),
            nameForm(),
            MyStyle().mySizebox(),
            priceForm(),
            MyStyle().mySizebox(),
            detailForm(),
            saveButton(),
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      //width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
          color: MyStyle().primaryColor,
          onPressed: () {
            if (file == null) {
              normalDialog(context, 'ກະລຸນາໃສ່ຮູບອາຫານກ່ອນ !');
            } else if (nameFood == null ||
                nameFood.isEmpty ||
                price == null ||
                price.isEmpty ||
                detail == null ||
                detail.isEmpty) {
              normalDialog(context, 'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບຖ້ວນ !');
            } else {
              uploadFoodAndInsertData();
            }
          },
          icon: Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
          label: Text(
            'ບັນທຶກ',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Future<Null> uploadFoodAndInsertData() async {
    String urlUpload = '${MyConstant().domain}/flutterOne/saveFood.php';

    Random random = Random();
    int i = random.nextInt(1000000);
    String nameFile = 'food$i.jpg';

    try {
      // ສ້າງ map ເພື່ອມາຮັບ file ຮູບພາບແລະເກັບໄວ້ໃນ formData
      Map<String, dynamic> map = Map();
      map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
      FormData formData = FormData.fromMap(map);

      // Upload ຮູບພາບລົງ Folder ທີ່ຊື່ Food
      await Dio().post(urlUpload, data: formData).then((value) async {
        String urlPathImage = '/flutterOne/Food/$nameFile';
        print('urlPathImage = ${MyConstant().domain}$urlPathImage');

        // ຫາຄ່າ id ຂອງ idShop
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String idShop = preferences.getString('id');

        // Insert ຂໍ້ມູນລົງ Database ໃນ Server
        String urlInsertData =
            '${MyConstant().domain}/flutterOne/addFood.php?isAdd=true&idShop=$idShop&NameFood=$nameFood&PathImage=$urlPathImage&Price=$price&Detail=$detail';
        await Dio().get(urlInsertData).then((value) => Navigator.pop(context));
      });
    } catch (e) {}
  }

  Widget nameForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => nameFood = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.fastfood),
            labelText: 'ຊື່ອາຫານ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget priceForm() => Container(
        width: 250.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => price = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            labelText: 'ລາຄາອາຫານ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget detailForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => detail = value.trim(),
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.details),
            labelText: 'ລາຍລະອຽດອາຫານ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget showTitleDetailFood(String string) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          MyStyle().showAppName2(string),
        ],
      ),
    );
  }

  Row groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => chooseImage(ImageSource.camera),
        ),
        Container(
          width: 250.0,
          height: 250.0,
          child:
              file == null ? Image.asset('images/food.png') : Image.file(file),
        ),
        IconButton(
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () => chooseImage(ImageSource.gallery),
        ),
      ],
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker().getImage(
        source: source,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );
      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
  }

  Widget showTitleFood(String string) {
    return MyStyle().showAppName2(string);
  }
}
