import 'package:dio/dio.dart';
import 'package:fastfood/screens/add_food_menu.dart';
import 'package:fastfood/utility/my_constant.dart';
import 'package:fastfood/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListFoodMenuShop extends StatefulWidget {
  @override
  _ListFoodMenuShopState createState() => _ListFoodMenuShopState();
}

class _ListFoodMenuShopState extends State<ListFoodMenuShop> {
  //Field
  bool status = true; //  Have Data
  bool loadStatus = true; //Process Load Json

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFoodMenu();
  }

  Future<Null> readFoodMenu() async {
    //ຫາຄ່າ id ຂອງ idShop
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idShop = preferences.getString('id');
    print('idShop = $idShop');

    //ດືງຂໍ້ມູນ idShop ຜ່ານ API ມາເກັບໄວ້ໃນ url ແລະ ໃຊ້ await Dio().get(url); ມາເກັບໄວ້ໃນ response
    String url =
        '${MyConstant().domain}/flutterOne/getFoodWhereIdShop.php?isAdd=true&idShop=$idShop';
    await Dio().get(url).then((value) {
      setState(() {
        loadStatus = false;
      });

      if (value.toString() != 'null') {
      } else {
        setState(() {
          print('test');
          status = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loadStatus ? MyStyle().showProgress() : showContent(),
        addMenuButton(),
      ],
    );
  }

  Widget showContent() {
    return status
        ? Text('ລາຍການອາຫານຂອງຮ້ານທີ່ມີ')
        : Center(
            child: Text('ຍັງບໍ່ມີລາຍການອາຫານ'),
          );
  }

  Widget addMenuButton() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 16.0, right: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => AddFoodMenu(),
                    );
                    Navigator.push(context, route);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      );
}
