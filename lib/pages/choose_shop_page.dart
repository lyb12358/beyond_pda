import 'package:beyond_pda/controller/choose_shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseShopPage extends GetView<ChooseShopController> {
  const ChooseShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChooseShopController());
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('选择门店'),
          ),
          body: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(30),
              itemExtent: 200,
              children: List.generate(
                  controller.shopList.length,
                  (index) => Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                                '${controller.shopList[index]['shopName']}',
                                style: TextStyle(fontSize: 28)),
                            subtitle:
                                Text(controller.shopList[index]['shopNo']),
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                controller
                                    .chooseShop(controller.shopList[index]);
                                Get.back();
                                debugPrint(
                                    '选择了${controller.shopList[index]['shopName']}');
                              },
                              icon: Icon(
                                Icons.pan_tool_alt_outlined,
                              ),
                              label: Text('选择'))
                        ],
                      )))),
        ));
  }
}
