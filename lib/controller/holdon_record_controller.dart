import 'package:beyond_pda/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/inventory.dart';
import '../repository/product_repository.dart';

class HoldonRecordController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
//搜索框
  final idCtrl = TextEditingController().obs;
  final remarkCtrl = TextEditingController().obs;
  final timeCtrl = TextEditingController().obs;
  final startTime = ''.obs;
  final endTime = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  //盘点挂单列表
  Future<void> getHoldonInventoryList() async {
    inventoryList.value =
        await _productRepository.getHoldonInventoryList(c.shopId.value);
  }

  restoreScan(Inventory x) {
    c.codeList.value = [];
    c.codeList.addAll(x.inventoryList!);
    var singleProd = c.codeList[0];
    c.currentProd.value.prodCode = singleProd.prodCode ?? '';
    c.currentProd.value.prodName = singleProd.prodName ?? '';
    c.currentProd.value.catName = singleProd.catName ?? '';
    c.currentProd.value.speName = singleProd.speName ?? '';
    c.currentProd.value.codeThumbnail = singleProd.codeThumbnail ?? '';
    c.currentProd.value.styleId = singleProd.styleId ?? 0;
    c.currentProd.value.codeId = singleProd.codeId ?? 0;
    c.currentProd.value.styleThumbnail = singleProd.styleThumbnail ?? '';
    c.currentProd.value.typeName = singleProd.typeName ?? '';
    c.currentProd.value.yearName = singleProd.yearName ?? '';
    c.currentProd.value.onlineNum = singleProd.onlineNum!;
    c.currentProd.value.num = singleProd.num!;
    c.currentProd.value.diffNum = singleProd.num! - singleProd.onlineNum!;
    c.inventory.value = x;
    c.recordStatus.value = 2;
    c.manualInputController.value.text = (singleProd.num).toString();
  }

  filterInventory() {
    inventoryList.value = inventoryList.where((element) {
      return (idCtrl.value.text.isNotEmpty
              ? (element.id!).toString() == idCtrl.value.text
              : true) &&
          (remarkCtrl.value.text.isNotEmpty
              ? (element.remark ?? '').contains(remarkCtrl.value.text)
              : true) &&
          (startTime.value.isNotEmpty
              ? DateTime.parse(element.createTime!)
                  .isAfter(DateTime.parse(startTime.value))
              : true) &&
          (endTime.value.isNotEmpty
              ? DateTime.parse(element.createTime!)
                  .isBefore(DateTime.parse(endTime.value))
              : true);
    }).toList();
  }

  resetForm() async {
    idCtrl.value.text = '';
    remarkCtrl.value.text = '';
    timeCtrl.value.text = '';
    startTime.value = '';
    endTime.value = '';
    getHoldonInventoryList();
  }

  changeTime(x, y) {
    startTime.value = DateFormat('yyyy-MM-dd').format(x);
    endTime.value = DateFormat('yyyy-MM-dd').format(y);
    timeCtrl.value.text = '${startTime.value}~${endTime.value}';
  }
}
