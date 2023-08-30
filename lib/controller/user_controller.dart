import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/models/github_user.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  late UserRepository _userRepository;
  final user = {}.obs;
  final isLogin = false.obs;
  final name = ''.obs;
  final pwd = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    //getUserInfo();
  }

  getUserInfo() async {
    try {
      final userInfo = await _userRepository.getUserInfo();
      user.value = userInfo;
      GetStorage box = GetStorage();
      String xx = box.read('name') ?? '';
      Get.snackbar('登录成功', '欢迎你$xx');
      Get.offAll(() => OnlineWorkshopPage());
    } catch (e) {
      // 处理错误，例如显示错误消息
      debugPrint('Error getting user info: $e');
    }
  }

  void login(String name, String pwd) async {
    print('开始判断');
    if (await _userRepository.login(name, pwd)) {
      print('login 好了');
      await getUserInfo();
    }
    print('失败！！！！！');
  }

  getShopList() async {
    GetStorage box = GetStorage();
    String xx = box.read('workCode') ?? '';
    return await _userRepository.getShopList(xx);
  }
}
