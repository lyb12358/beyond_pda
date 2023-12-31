import 'package:beyond_pda/models/product_data.dart';
import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:beyond_pda/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../models/inventory.dart';
import '../pages/home_page.dart';

class UserController extends GetxController {
  late UserRepository _userRepository;
  late ProductRepository _productRepository;
  final user = {}.obs;
  final operations = [].obs;
  final name = ''.obs;
  final pwd = ''.obs;
  final isObscure = true.obs;
  final updateTime = ''.obs;
  final singleProd = ProductData().obs;
  //shop
  final brandId = 0.obs;
  final departId = 0.obs;
  final shopId = 0.obs;
  final shopName = ''.obs;
  final shopNo = ''.obs;
  //inventory
  final codeList = <OnlineSingleProdInventory>[].obs;
  final onlineInventoryList = <OnlineSingleProdInventory>[].obs;
  final currentProd = OnlineSingleProdInventory().obs;
  //单独扫码库存变动控制器
  final manualInputController = TextEditingController().obs;
  //备注框
  final remarkInputController = TextEditingController();
  //record_detail数量
  final countInputController = TextEditingController();
  //记录
  final recordStatus = 1.obs; // 1. 在线扫码记录  2. 挂单记录 3. 历史记录
  final inventory = Inventory().obs;
  //temporary variable
  final tempBaseUrl = "https://ims-backend.beyond-itservice.com";

  final isSearch = false.obs;

  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    _productRepository = Get.find();
    updateTime.value = box.read('updateTime') ?? '';
    brandId.value = box.read('brandId') ?? 0;
    departId.value = box.read('departId') ?? 0;
    shopId.value = box.read('shopId') ?? 0;
    shopName.value = box.read('shopName') ?? '';
    shopNo.value = box.read('shopNo') ?? '';
  }

  getUserInfo() async {
    try {
      final userInfo = await _userRepository.getUserInfo();
      operations.value = await _userRepository.getMenusByBrand();
      //如果只有一家门店，默认选择
      var spList = [];
      spList = await getShopList();
      if (spList.length == 1) {
        chooseShop(spList[0]);
      }
      // debugPrint((operations.firstWhere((element) =>
      //             element['operationType'] ==
      //             'directInventory:view')['columnPermissions'] ??
      //         [])
      //     .any((element) => element['columnName'] == 'supplyPrice')
      //     .toString());
      // debugPrint((operations.firstWhere((element) =>
      //             element['operationType'] ==
      //             'productList:view')['columnPermissions'] ??
      //         [])
      //     .any((element) => element['columnName'] == 'supplyPrice')
      //     .toString());
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

  void chooseShop(Map map) {
    brandId.value = map['brandId'];
    box.write('brandId', map['brandId']);
    departId.value = map['departId'];
    box.write('departId', map['departId']);
    shopId.value = map['id'];
    box.write('shopId', map['id']);
    shopNo.value = map['shopNo'];
    box.write('shopNo', map['shopNo']);
    shopName.value = map['shopName'];
    box.write('shopName', map['shopName']);
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
    //商品不在资料库则报错
    await getSingleProd(code);
    if ((singleProd.value.prodCode ?? '').isEmpty) {
      Get.snackbar('警告', '非博洋产品，将不计入盘点!');
      return;
    }
    debugPrint('1第一个商品是${codeList.isNotEmpty ? codeList[0].prodName : '空'}');
    int onlineNum = getOnlineNum(code);
    currentProd.value.prodCode = singleProd.value.prodCode ?? '';
    currentProd.value.prodName = singleProd.value.prodName ?? '';
    currentProd.value.catName = singleProd.value.catName ?? '';
    currentProd.value.speName = singleProd.value.speName ?? '';
    currentProd.value.codeThumbnail = singleProd.value.codeThumbnail ?? '';
    currentProd.value.styleId = singleProd.value.styleId ?? 0;
    currentProd.value.codeId = singleProd.value.codeId ?? 0;
    currentProd.value.styleThumbnail = singleProd.value.styleThumbnail ?? '';
    currentProd.value.typeName = singleProd.value.typeName ?? '';
    currentProd.value.yearName = singleProd.value.yearName ?? '';
    currentProd.value.onlineNum = onlineNum;
    debugPrint('2第一个商品是${codeList.isNotEmpty ? codeList[0].prodName : '空'}');
    if (checkCodeExist(codeList, code)) {
      debugPrint('编号存在');
      debugPrint('列表尺寸${codeList.length}');
      debugPrint('3第一个商品是${codeList.isNotEmpty ? codeList[0].prodName : '空'}');
      int i = codeList.indexWhere((element) => element.prodCode == code);
      debugPrint('索引是$i');
      OnlineSingleProdInventory spd = codeList[i];
      int num = spd.num!;
      debugPrint('老库存是$num');
      currentProd.value.num = num + 1;
      currentProd.value.diffNum = num + 1 - onlineNum;
      spd.num = num + 1;
      spd.diffNum = num + 1 - onlineNum;
      debugPrint('新库存是${currentProd.value.num}');
      codeList.removeAt(i);
      codeList.insert(0, spd);
    } else {
      debugPrint('编号不存在');
      currentProd.value.num = 1;
      currentProd.value.diffNum = 1 - onlineNum;
      var spd = OnlineSingleProdInventory();
      spd.prodCode = currentProd.value.prodCode;
      spd.prodName = currentProd.value.prodName;
      spd.catName = currentProd.value.catName;
      spd.speName = currentProd.value.speName;
      spd.codeThumbnail = currentProd.value.codeThumbnail;
      spd.styleId = currentProd.value.styleId;
      spd.codeId = currentProd.value.codeId;
      spd.styleThumbnail = currentProd.value.styleThumbnail;
      spd.typeName = currentProd.value.typeName;
      spd.yearName = currentProd.value.yearName;
      spd.num = 1;
      spd.onlineNum = onlineNum;
      spd.diffNum = currentProd.value.diffNum;
      codeList.insert(0, spd);
    }
    //改变输入框的值
    manualInputController.value.text = (currentProd.value.num).toString();
    currentProd.refresh();
  }

  //改变扫码商品库存时调用
  setInventory(int newVal) {
    currentProd.value.num = newVal;
    currentProd.value.diffNum = newVal - currentProd.value.onlineNum!;
    //刷新对象防止响应式对象污染list
    currentProd.refresh();
    debugPrint('新值是$newVal');
    debugPrint('老库存是是${currentProd.value.onlineNum}');
    debugPrint('差异是${currentProd.value.diffNum}');
    int i = codeList.indexWhere(
        (element) => element.prodCode == currentProd.value.prodCode);
    OnlineSingleProdInventory spd = codeList[i];
    spd.num = newVal;
    spd.diffNum = currentProd.value.diffNum;
    codeList[i] = spd;
  }

  //改变record_detail数量时调用
  setInventoryInDetail(String code, int newVal) {
    int i = codeList.indexWhere((element) => element.prodCode == code);
    var spd = codeList[i];
    spd.num = newVal;
    spd.diffNum = newVal - spd.onlineNum!;
    codeList[i] = spd;
    if (i == 0) {
      currentProd.value.num = newVal;
      currentProd.value.diffNum = newVal - currentProd.value.onlineNum!;
      currentProd.refresh();
      manualInputController.value.text = newVal.toString();
    }
  }

  bool checkCodeExist(List<OnlineSingleProdInventory> list, String code) {
    if (list.isEmpty) {
      return false;
    }
    return list.any((element) => element.prodCode == code);
  }

  //门店库存
  Future<void> getOnlineInventory() async {
    var listDynamic = await _productRepository.getOnlineInventory(shopId.value);
    onlineInventoryList.value = (listDynamic as List<dynamic>).map((e) {
      var spd = OnlineSingleProdInventory();
      spd.prodCode = e['prodCode'];
      spd.styleId = 0;
      spd.codeId = 0;
      spd.num = 0;
      spd.onlineNum = e['prodCount'];
      spd.diffNum = 0;
      return spd;
    }).toList();
  }

  int getOnlineNum(String code) {
    if (onlineInventoryList.isEmpty) {
      return 0;
    }
    if (checkCodeExist(onlineInventoryList, code)) {
      return onlineInventoryList
          .firstWhere((element) => element.prodCode == code)
          .onlineNum!;
    } else {
      return 0;
    }
  }

  Future<bool> addOnlineInventory(String remark) async {
    return await _productRepository.addOnlineInventory(
        brandId.value, shopId.value, remark, codeList);
  }

  Future<bool> updateOnlineInventory(String remark) async {
    return await _productRepository.updateOnlineInventory(
        inventory.value.documentId!,
        inventory.value.documentCode!,
        shopId.value,
        remark,
        codeList);
  }

  Future<bool> syncOnlineInventory(Inventory x) async {
    return await _productRepository.addOnlineInventory(
        brandId.value, shopId.value, x.remark ?? '', x.inventoryList!);
  }

  Future<bool> putHoldonInventory(String remark) async {
    //清洗列表，全部设置为true
    codeList.value = codeList.map((element) {
      element.visible = true;
      return element;
    }).toList();
    inventory.value.remark = remark;
    inventory.value.shopId = shopId.value;
    inventory.value.inventoryList = codeList;
    inventory.value.prodTotal = codeList.length;
    inventory.value.total = calTotalNum();
    inventory.value.createTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    await _productRepository.putInventory(inventory.value);
    return true;
  }

  Future<bool> deleteHoldonInventory(int id) async {
    await _productRepository.deleteInventory(id);
    return true;
  }

  calTotalNum() {
    var totalNum = 0;
    for (var item in codeList) {
      totalNum = totalNum + (item.num ?? 0);
    }
    return totalNum;
  }

  calTotalOnlineNum() {
    var totalOnlineNum = 0;
    for (var item in onlineInventoryList) {
      totalOnlineNum = totalOnlineNum + (item.onlineNum ?? 0);
    }
    return totalOnlineNum;
  }

  resetOnlineScan() {
    singleProd.value = ProductData();
    codeList.value = [];
    currentProd.value = OnlineSingleProdInventory();
    inventory.value = Inventory();
    recordStatus.value = 1;
  }

  //pm计算图片地址
  String calImageUrl(OnlineSingleProdInventory prod) {
    String baseLocation = tempBaseUrl;
    String codeLocation = "/image/code/";
    String matLocation = "/image/mat/";
    String styleLocation = "/image/style/";
    if ((prod.codeThumbnail ?? '').isEmpty &&
        (prod.styleThumbnail ?? '').isEmpty) {
      return '$baseLocation/template/noImage.jpg';
    } else if ((prod.styleId ?? 0) == 0) {
      return '$baseLocation$matLocation${prod.codeId}/${prod.codeThumbnail}';
    } else if ((prod.codeThumbnail ?? '').isEmpty) {
      return '$baseLocation$styleLocation${prod.styleId}/${prod.styleThumbnail}';
    } else {
      return '$baseLocation$codeLocation${prod.codeId}/${prod.codeThumbnail}';
    }
  }

  //pm计算图片地址(map)
  String calImageUrlByMap(Map prod) {
    String baseLocation = tempBaseUrl;
    String codeLocation = "/image/code/";
    String matLocation = "/image/mat/";
    String styleLocation = "/image/style/";
    if ((prod['codeThumbnail'] ?? '').isEmpty &&
        (prod['styleThumbnail'] ?? '').isEmpty) {
      return '$baseLocation/template/noImage.jpg';
    } else if ((prod['styleId'] ?? 0) == 0) {
      return '$baseLocation$matLocation${prod['codeId']}/${prod['codeThumbnail']}';
    } else if ((prod['codeThumbnail'] ?? '').isEmpty) {
      return '$baseLocation$styleLocation${prod['styleId']}/${prod['styleThumbnail']}';
    } else {
      return '$baseLocation$codeLocation${prod['codeId']}/${prod['codeThumbnail']}';
    }
  }
}
