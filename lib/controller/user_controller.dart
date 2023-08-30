import 'dart:convert';

import 'package:beyond_pda/models/product_data.dart';
import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:beyond_pda/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  late UserRepository _userRepository;
  late ProductRepository _productRepository;
  final user = {}.obs;
  final name = ''.obs;
  final pwd = ''.obs;
  final updateTime = ''.obs;
  final singleProd = ProductData().obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    _productRepository = Get.find();
    updateTime.value = box.read('updateTime') ?? '';
    //getUserInfo();
  }

  getUserInfo() async {
    try {
      final userInfo = await _userRepository.getUserInfo();
      user.value = userInfo;
      String xx = box.read('name') ?? '';
      name.value = user['realName'];
      Get.snackbar('登录成功', '欢迎你$xx');
      Get.offAll(() => OnlineWorkshopPage());
    } catch (e) {
      // 处理错误，例如显示错误消息
      debugPrint('Error getting user info: $e');
    }
  }

  login(String name, String pwd) async {
    if (await _userRepository.login(name, pwd)) {
      await getUserInfo();
    }
  }

  getShopList() async {
    String xx = box.read('workCode') ?? '';
    return await _userRepository.getShopList(xx);
  }

  updatePdaData() async {
    var listDynamic = await _productRepository.getPdaData();
    List<ProductData> prodList = (listDynamic as List<dynamic>)
        .map((e) => ProductData.fromJson((e as Map<String, dynamic>)))
        .toList();
    await _productRepository.batchInset(prodList);
    updateTime.value = box.read('updateTime') ?? '';
  }

  getSingleProd(String code) async {
    singleProd.value =
        await _productRepository.getSingleProd(code) ?? ProductData();
  }
}
