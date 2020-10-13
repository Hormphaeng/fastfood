import 'package:fastfood/screens/main_rider.dart';
import 'package:fastfood/screens/main_shop.dart';
import 'package:fastfood/screens/main_user.dart';
import 'package:fastfood/screens/signIn.dart';
import 'package:fastfood/screens/signUp.dart';
import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreference();
  }

  Future<Null> checkPreference() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routToService(MainUser());
        } else if (chooseType == 'Shop') {
          routToService(MainShop());
        } else if (chooseType == 'Rider') {
          routToService(MainRider());
        } else {
          normalDialog(context, 'Error');
        }
      }
    } catch (e) {}
  }

  void routToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            signUpMenu(),
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route = MaterialPageRoute(
          builder: (BuildContext context) => SignIn(),
        );
        Navigator.of(context).push(route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.of(context).pop();
        MaterialPageRoute route = MaterialPageRoute(
          builder: (BuildContext context) => SignUp(),
        );
        Navigator.of(context).push(route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDexcoration('pic.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Welcome'),
      accountEmail: Text('Please Login'),
    );
  }
}
