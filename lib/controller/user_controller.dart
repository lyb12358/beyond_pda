import 'package:beyond_pda/models/product_data.dart';
import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:beyond_pda/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../pages/home_page.dart';

class UserController extends GetxController {
  late UserRepository _userRepository;
  late ProductRepository _productRepository;
  final user = {}.obs;
  final name = ''.obs;
  final pwd = ''.obs;
  final updateTime = ''.obs;
  final singleProd = ProductData().obs;
  //shop
  final brandId = 0.obs;
  final shopId = 0.obs;
  final shopName = ''.obs;
  final shopNo = ''.obs;
  //onlineData
  final codeList = <OnlineSingleProdInventory>[].obs;
  final onlineInventoryList = <OnlineSingleProdInventory>[].obs;
  final currentProd =
      OnlineSingleProdInventory('', '', '', '', '', 0, 0, 0, 0).obs;
  //库存变动控制器
  final manualInputController = TextEditingController().obs;
  //temporary variable
  final tempBaseUrl = "https://ims-backend.beyond-itservice.com";

  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    _productRepository = Get.find();
    updateTime.value = box.read('updateTime') ?? '';
    brandId.value = box.read('brandId') ?? 0;
    shopId.value = box.read('shopId') ?? 0;
    shopName.value = box.read('shopName') ?? '';
    shopNo.value = box.read('shopNo') ?? '';
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

  logout() async {
    box.erase();
    onInit();
    Get.offAll(() => HomePage());
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
    Get.snackbar('提示', '商品资料下载成功！');
  }

  getSingleProd(String code) async {
    singleProd.value =
        await _productRepository.getSingleProd(code) ?? ProductData();
  }

  // online scan
  Future<void> addCode(
    String code,
  ) async {
    await getSingleProd(code);
    int onlineNum = getOnlineNum(code);
    currentProd.value.code = singleProd.value.prodCode ?? '';
    currentProd.value.prodName = singleProd.value.prodName ?? '';
    currentProd.value.catName = singleProd.value.catName ?? '';
    currentProd.value.speName = singleProd.value.speName ?? '';
    currentProd.value.codeThumbnail = singleProd.value.codeThumbnail ?? '';
    currentProd.value.styleId = singleProd.value.styleId ?? 0;
    currentProd.value.onlineNum = onlineNum;
    //新建对象防止响应式对象污染list
    if (checkCodeExist(codeList, code)) {
      debugPrint('编号存在');
      debugPrint('列表尺寸${codeList.length}');
      int i = codeList.indexWhere((element) => element.code == code);
      debugPrint('索引是$i');
      OnlineSingleProdInventory spd = codeList[i];
      int num = spd.num;
      debugPrint('老库存是$num');
      currentProd.value.num = num + 1;
      currentProd.value.diffNum = num + 1 - onlineNum;
      debugPrint('新库存是${currentProd.value.num}');
      if (i == 0) {
        codeList[0] = OnlineSingleProdInventory(
            currentProd.value.code,
            currentProd.value.prodName,
            currentProd.value.catName,
            currentProd.value.speName,
            currentProd.value.codeThumbnail,
            currentProd.value.styleId,
            num + 1,
            onlineNum,
            currentProd.value.diffNum);
      } else {
        codeList.removeAt(i);
        codeList.insert(
            0,
            OnlineSingleProdInventory(
                currentProd.value.code,
                currentProd.value.prodName,
                currentProd.value.catName,
                currentProd.value.speName,
                currentProd.value.codeThumbnail,
                currentProd.value.styleId,
                num + 1,
                onlineNum,
                currentProd.value.diffNum));
      }
    } else {
      debugPrint('编号不存在');
      currentProd.value.num = 1;
      currentProd.value.diffNum = 1 - onlineNum;
      codeList.insert(
          0,
          OnlineSingleProdInventory(
              currentProd.value.code,
              currentProd.value.prodName,
              currentProd.value.catName,
              currentProd.value.speName,
              currentProd.value.codeThumbnail,
              currentProd.value.styleId,
              1,
              onlineNum,
              currentProd.value.diffNum));
    }
    //改变输入框的值
    manualInputController.value.text = (currentProd.value.num).toString();
  }

  //改变扫码商品库存时调用
  setInventory(int newVal) {
    currentProd.value.num = newVal;
    currentProd.value.diffNum = newVal - currentProd.value.onlineNum;
    currentProd.refresh();
    debugPrint('新值是$newVal');
    debugPrint('老库存是是${currentProd.value.onlineNum}');
    debugPrint('差异是${currentProd.value.diffNum}');
    int i = codeList
        .indexWhere((element) => element.code == currentProd.value.code);
    codeList[i] = OnlineSingleProdInventory(
        currentProd.value.code,
        currentProd.value.prodName,
        currentProd.value.catName,
        currentProd.value.speName,
        currentProd.value.codeThumbnail,
        currentProd.value.styleId,
        newVal,
        currentProd.value.onlineNum,
        currentProd.value.diffNum);
  }

  bool checkCodeExist(List<OnlineSingleProdInventory> list, String code) {
    if (list.isEmpty) {
      return false;
    }
    return list.any((element) => element.code == code);
  }

  //门店库存
  Future<void> getOnlineInventory() async {
    var listDynamic = await _productRepository.getOnlineInventory(shopId.value);
    onlineInventoryList.value = (listDynamic as List<dynamic>)
        .map((e) => OnlineSingleProdInventory(
            e['prodCode'], '', '', '', '', 0, 0, e['prodCount'], 0))
        .toList();
  }

  int getOnlineNum(String code) {
    if (onlineInventoryList.isEmpty) {
      return 0;
    }
    if (checkCodeExist(onlineInventoryList, code)) {
      return onlineInventoryList
          .firstWhere((element) => element.code == code)
          .onlineNum;
    } else {
      return 0;
    }
  }
}

class OnlineSingleProdInventory {
  String code;
  String prodName;
  String catName;
  String speName;
  String codeThumbnail;
  int styleId;
  //数量
  int num;
  int onlineNum;
  int diffNum;
  OnlineSingleProdInventory(
      this.code,
      this.prodName,
      this.catName,
      this.speName,
      this.codeThumbnail,
      this.styleId,
      this.num,
      this.onlineNum,
      this.diffNum);
}
