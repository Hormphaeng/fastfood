import 'package:fastfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class AddFoodMenu extends StatefulWidget {
  @override
  _AddFoodMenuState createState() => _AddFoodMenuState();
}

class _AddFoodMenuState extends State<AddFoodMenu> {
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
          onPressed: () {},
          icon: Icon(Icons.save_alt),
          label: Text('ບັນທຶກ')),
    );
  }

  Widget nameForm() => Container(
        width: 250.0,
        child: TextField(
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
        IconButton(icon: Icon(Icons.add_a_photo), onPressed: null),
        Container(
          width: 250.0,
          height: 250.0,
          child: Image.asset('images/food.png'),
        ),
        IconButton(icon: Icon(Icons.add_photo_alternate), onPressed: null),
      ],
    );
  }

  Widget showTitleFood(String string) {
    return MyStyle().showAppName2(string);
  }
}
