import 'package:fastfood/utility/my_style.dart';
import 'package:fastfood/utility/signout_process.dart';
import 'package:fastfood/widget/information_shop.dart';
import 'package:fastfood/widget/list_food_menu.dart';
import 'package:fastfood/widget/order_list_shop.dart';
import 'package:flutter/material.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOut(),
            // signInMenu(),
            // signUpMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(
          Icons.home,
          color: Colors.blue,
        ),
        title: Text(
          'ລາຍການອາຫານທີ່ລູກຄ້າສັ່ງ',
          style: TextStyle(color: Colors.blue),
        ),
        subtitle: Text('ລາຍການອາຫານທີ່ຍັງບໍ່ໄດ້ເຮັດສົ່ງ'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(
          Icons.fastfood,
          color: Colors.orange,
        ),
        title: Text(
          'ລາຍການອາຫານ',
          style: TextStyle(color: Colors.orange),
        ),
        subtitle: Text('ລາຍການອາຫານຂອງຮ້ານ'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(
          Icons.info,
          color: Colors.green,
        ),
        title: Text(
          'ລາຍລະອຽດຂອງຮ້ານ',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        subtitle: Text('ລາຍລະອຽດຕ່າງໆຂອງຮ້ານ'),
        onTap: () {
          setState(() {
            currentWidget = InformationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOut() => ListTile(
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.purple,
        ),
        title: Text('SignOut'),
        subtitle: Text('ອອກ ແລະ ກັບໄປຫນ້າຫຫລັກ'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDexcoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Welcome'),
      accountEmail: Text('Please Login'),
    );
  }
}
