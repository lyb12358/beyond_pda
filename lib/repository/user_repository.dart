import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/service/http_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository extends GetxService {
  late HttpService _httpService;

  UserRepository init() {
    _httpService = Get.find<HttpService>();
    return this;
  }

  Future getUserInfo() async {
    try {
      final response = await _httpService.post(
          '/beyond-usercenter/common/getUserInfo',
          data: {'systemCode': 'TerminalPlatform'});
      if (response.data['code'] == 200) {
        GetStorage box = GetStorage();
        box.write('userId', response.data['data']['sysUser']['id']);
        box.write('name', response.data['data']['sysUser']['realName']);
        box.write('workCode', response.data['data']['sysUser']['workCode']);
        return response.data['data']['sysUser'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
    }
  }

  getToken() {
    GetStorage box = GetStorage();
    var token = box.read("x-token") ?? '';
    return token;
  }

  setToken(String token) {
    GetStorage box = GetStorage();
    box.write("x-token", token);
  }

  Future<bool> login(String name, String pwd) async {
    try {
      final response = await _httpService.post('/beyond-usercenter/login',
          data: {'username': name, 'password': pwd});
      if (response.data['code'] == 200) {
        setToken(response.data['data']['token']);
        GetStorage box = GetStorage();
        box.write('account', name);
        box.write('pwd', pwd);
        return true;
      } else {
        Get.snackbar('警告', response.data['msg']);
        return false;
      }
    } on DioException catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
      return false;
    }
  }

  getShopList(String workCode) async {
    try {
      final response = await _httpService.post(
          '/beyond-usercenter/common/getUserShopsIgnoreBrand',
          data: {'systemCode': 'TerminalPlatform', 'workCode': workCode});
      if (response.data['code'] == 200) {
        return response.data['data']['shops'];
      } else {
        Get.snackbar('警告', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('警告', '网络连接失败');
    }
  }

  String getCodeFromUrl(String url, String paramName) {
    Uri uri = Uri.parse(url);
    Map<String, dynamic> queryParameters = uri.queryParameters;
    return queryParameters[paramName];
  }
}
