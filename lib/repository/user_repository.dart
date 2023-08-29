import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/models/github_user.dart';
import 'package:beyond_pda/service/http_service.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository extends GetxService {
  late HttpService _httpService;

  static const clientId = "Iv1.7f5b0df57491a993";
  static const scheme = "valid-callback-scheme";
  static const authUrl = 'https://github.com/login/oauth/access_token';

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
        Get.snackbar('失败', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
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

  login(String name, String pwd) async {
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
        Get.snackbar('失败', response.data['msg']);
        return false;
      }
    } on DioException catch (e) {
      // 处理错误，例如自动重试
      debugPrint(e.toString());
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
        Get.snackbar('失败', response.data['msg']);
        throw Exception('请求失败');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String getCodeFromUrl(String url, String paramName) {
    Uri uri = Uri.parse(url);
    Map<String, dynamic> queryParameters = uri.queryParameters;
    return queryParameters[paramName];
  }

  /// 注意，这部分代码一定要在服务端执行，不要在客户端执行，否则会暴露你的客户端密钥
  Future<String> getAccessToken(String authorizationCode) async {
    const String clientSecret =
        '4d6652d*******************409ed61c'; // 替换为你的 GitHub OAuth App 客户端密钥

    try {
      final response = await Dio().post(
        authUrl,
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': authorizationCode,
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      // 解析返回的 JSON 数据，提取 access_token
      final Map<String, dynamic> data = response.data;
      if (data.containsKey('access_token')) {
        return data['access_token'];
      } else {
        throw Exception('Access token not found in response.');
      }
    } catch (e) {
      throw Exception('Failed to get access token: $e');
    }
  }
}
