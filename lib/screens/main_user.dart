import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/signout_process.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = sharedPreferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser login'),
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
    return UserAccountsDrawerHeader(decoration: MyStyle().myBoxDexcoration('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      // decoration: MyStyle().myBoxDexcoration('pic.jpg'),
      // currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Welcome', style: TextStyle(color: Colors.yellow),),
      accountEmail: Text('Please Login', style: TextStyle(color: Colors.yellow),),
    );
  }
}
