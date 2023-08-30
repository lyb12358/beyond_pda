import 'package:beyond_pda/pages/inventory_query_page.dart';
import 'package:beyond_pda/pages/online_gridview_page.dart';
import 'package:beyond_pda/pages/prod_query_page.dart';
import 'package:beyond_pda/pages/user_deatail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';

class OnlineWorkshopPage extends StatefulWidget {
  const OnlineWorkshopPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnlineWorkshopState createState() => _OnlineWorkshopState();
}

class _OnlineWorkshopState extends State<OnlineWorkshopPage> {
  final List<BrnBottomTabBarItem> bottomTabs = [
    BrnBottomTabBarItem(
      icon: Icon(
        Icons.add_business,
      ),
      title: Text('门店盘点', style: TextStyle(fontSize: 16)),
    ),
    BrnBottomTabBarItem(
      icon: Icon(
        Icons.category,
      ),
      title: Text('产品查询', style: TextStyle(fontSize: 16)),
    ),
    BrnBottomTabBarItem(
      icon: Icon(
        Icons.inventory_2,
      ),
      title: Text('库存查询', style: TextStyle(fontSize: 16)),
    ),
    BrnBottomTabBarItem(
      icon: Icon(
        Icons.person,
      ),
      title: Text('我的', style: TextStyle(fontSize: 16)),
    ),
  ];
  final List tabBodies = [
    OnlineGridviewPage(),
    ProdQueryPage(),
    InventoryQueryPage(),
    UserDetailPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      bottomNavigationBar: BrnBottomTabBar(
        currentIndex: currentIndex,
        items: bottomTabs,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
