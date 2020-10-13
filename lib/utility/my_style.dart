import 'dart:ui';

import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.green.shade600;
  Color primaryColor = Colors.blue.shade600;

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 10.0,
      );

  Widget titleCenter(String string) {
    return Center(
      child: Text(string, style:  TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
    );
  }

  Text showAppName(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade600),
      );

  Text showAppName2(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade600),
      );

  BoxDecoration myBoxDexcoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/$namePic'), fit: BoxFit.cover),
    );
  }

  Container showLogo() {
    return Container(
      width: 50.0,
      child: Image.asset('images/logo.png'),
    );
  }

  MyStyle();
}
