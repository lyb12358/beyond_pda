import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/inventory.dart';
import '../repository/product_repository.dart';

class OfflineRecordController extends GetxController {
  OfflineScanController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = [].obs;
  //搜索框
  final timeCtrl = TextEditingController().obs;
  final startTime = ''.obs;
  final endTime = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  //离线列表
  Future<void> getOfflineInventoryList() async {
    inventoryList.value = await _productRepository.getOfflineInventoryList();
  }

  restoreScan(Inventory x) {
    c.codeList.value = [];
    c.codeList.addAll(x.inventoryList!);
    c.inventory.value = x;
  }

  filterInventory() {
    inventoryList.value = inventoryList.where((element) {
      return (startTime.value.isNotEmpty
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
    timeCtrl.value.text = '';
    startTime.value = '';
    endTime.value = '';
    getOfflineInventoryList();
  }

  changeTime(x, y) {
    startTime.value = DateFormat('yyyy-MM-dd').format(x);
    endTime.value = DateFormat('yyyy-MM-dd').format(y);
    timeCtrl.value.text = '${startTime.value}~${endTime.value}';
  }
}
