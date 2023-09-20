import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/inventory.dart';
import '../models/product_data.dart';
import '../repository/product_repository.dart';
//import 'package:get_storage/get_storage.dart';

class OfflineScanController extends GetxController {
  final codeList = <OnlineSingleProdInventory>[].obs;
  final inventory = Inventory().obs;
  //数量框
  final countInputController = TextEditingController();
  //备注框
  final remarkInputController = TextEditingController();

  static OfflineScanController get to => Get.find();
  late ProductRepository _productRepository;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  Future<void> addCode(String code) async {
    String name = (await getSingleProd(code)).prodName ?? '';
    var spd = OnlineSingleProdInventory();
    if (checkCodeExist(code)) {
      int i = codeList.indexWhere((element) => element.prodCode == code);
      spd = codeList[i];
      spd.num = spd.num! + 1;
      codeList.removeAt(i);
    } else {
      spd.prodCode = code;
      spd.prodName = name;
      spd.num = 1;
    }
    codeList.insert(0, spd);
  }

  Future<void> setCode(String code, int num) async {
    int i = codeList.indexWhere((element) => element.prodCode == code);
    var spd = codeList[i];
    spd.num = num;
    codeList[i] = spd;
  }

  bool checkCodeExist(String code) {
    if (codeList.isEmpty) {
      return false;
    }
    return codeList.any((element) => element.prodCode == code);
  }

  //查询产品
  Future<ProductData> getSingleProd(String code) async {
    return await _productRepository.getSingleProd(code) ?? ProductData();
  }

  Future<bool> putOfflineInventory(String remark) async {
    inventory.value.remark = remark;
    inventory.value.inventoryList = codeList;
    inventory.value.prodTotal = codeList.length;
    inventory.value.total = calTotalNum();
    //离线状态为4
    inventory.value.status = 4;
    inventory.value.createTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    await _productRepository.putInventory(inventory.value);
    return true;
  }

  calTotalNum() {
    var totalNum = 0;
    for (var item in codeList) {
      totalNum = totalNum + (item.num ?? 0);
    }
    return totalNum;
  }

  Future<bool> deleteOfflineInventory(int id) async {
    await _productRepository.deleteInventory(id);
    return true;
  }

  resetOfflineScan() {
    codeList.value = [];
    inventory.value = Inventory();
  }
}
