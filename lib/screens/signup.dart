import 'package:dio/dio.dart';
import 'package:fastfood/utility/my_constant.dart';
import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/normal_dialog.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingUp'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizebox(),
          showAppName(),
          MyStyle().mySizebox(),
          nameText(),
          MyStyle().mySizebox(),
          userText(),
          MyStyle().mySizebox(),
          passwordText(),
          MyStyle().mySizebox(),
          MyStyle().showAppName('ຊະນິດຂອງສະມາຊິກ:'),
          MyStyle().mySizebox(),
          userRadio(),
          shopRadio(),
          deliveryRadio(),
          MyStyle().mySizebox(),
          registerButton(),
        ],
      ),
    );
  }

  Widget registerButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            print(
                'name = $name, user = $user, password = $password, chooseType =$chooseType');
            if (name == null ||
                name.isEmpty ||
                user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('Have space');
              normalDialog(context, 'ມີຊ່ອງວ່າງ! ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ');
            } else if (chooseType == null) {
              normalDialog(context, 'ກະລຸນາ ! ເລືອກຊະນິດຜູ້ສະມັກ');
            } else {
              //registerThread();
              checkUser();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      );

  Future<Null> checkUser() async {
    String url =
        '${MyConstant().domain}/flutterOne/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      if (response.toString() == 'null') {
        registerThread();
      } else {
        normalDialog(context, 'user ນີ້ $user ຖືກໃຊ້ໄປແລ້ວ ! ກະລຸນາປ່ຽນໃຫມ່');
      }
    } catch (e) {}
  }

  Future<Null> registerThread() async {
    String url =
        '${MyConstant().domain}/flutterOne/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';

    try {
      Response response = await Dio().get(url);
      print('res = $response');

      if (response.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'ເກີດຂໍ້ຜິດພາດ ກະລຸນາ ລອງໃຫມ່');
      }
    } catch (e) {}
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (String value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ຜູ້ສັ່ງອາຫານ',
                  style: TextStyle(fontSize: 22.0, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Shop',
                  groupValue: chooseType,
                  onChanged: (String value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ເຈົ້າຂອງຮ້ານອາຫານ',
                  style: TextStyle(fontSize: 22.0, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      );

  Widget deliveryRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Rider',
                  groupValue: chooseType,
                  onChanged: (String value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ຜູ້ສົ່ງອາຫານ',
                  style: TextStyle(fontSize: 22.0, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      );

  Widget nameText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.account_circle, color: MyStyle().darkColor),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Name:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget userText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.account_circle, color: MyStyle().darkColor),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'User:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget passwordText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => password = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open, color: MyStyle().darkColor),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Password:',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showAppName('FastFood'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );
}
