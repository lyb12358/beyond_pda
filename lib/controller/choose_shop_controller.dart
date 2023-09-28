import 'package:beyond_pda/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChooseShopController extends GetxController {
  final shopList = [].obs;
  GetStorage box = GetStorage();
  late UserController c;

  //搜索框
  final spCtrl = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    c = Get.find();
    shopList.value = await c.getShopList();
  }

  filterShop() {
    shopList.value = shopList.where((element) {
      return ((element['shopName']).contains(spCtrl.value.text) ||
          (element['shopNo']).contains(spCtrl.value.text));
    }).toList();
  }

  resetForm() async {
    spCtrl.value.text = '';
    shopList.value = await c.getShopList();
  }
}
