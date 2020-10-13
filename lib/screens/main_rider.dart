import 'dart:ui';

import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/signout_process.dart';
import 'package:flutter/material.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Rider'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            // signInMenu(),
            // signUpMenu(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDexcoration('rider.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Welcome', style: TextStyle(color: Colors.green),),
      accountEmail: Text('Please Login',style: TextStyle(color: Colors.green),),
    );
  }
}
