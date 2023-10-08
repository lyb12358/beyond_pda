import 'package:beyond_pda/models/inventory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/product_data.dart';
import '../repository/product_repository.dart';
import 'user_controller.dart';

class HistoricRecordController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
  final operationLogList = [].obs;
  //搜索框
  final idCtrl = TextEditingController().obs;
  final remarkCtrl = TextEditingController().obs;
  final timeCtrl = TextEditingController().obs;
  final statusCtrl = TextEditingController().obs;
  final startTime = ''.obs;
  final endTime = ''.obs;
  final status = 5.obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  //盘点列表
  Future<void> getOnlineInventoryList() async {
    var listDynamic =
        await _productRepository.getOnlineInventoryList(c.shopId.value);
    inventoryList.value = (listDynamic as List<dynamic>).map((e) {
      var spd = Inventory();
      spd.shopId = e['shopId'];
      spd.userId = e['createUser'];
      spd.documentCode = e['documentCode'];
      spd.documentId = e['id'];
      spd.checkTime = e['checkTime'];
      spd.createTime = e['createTime'];
      spd.prodTotal = e['prodTotal'];
      spd.status = e['status'];
      spd.total = e['total'];
      spd.remark = e['remark'];
      return spd;
    }).toList();
  }

  //盘点状态修改
  Future<bool> changeOnlineInventoryStatus(int id, int action) async {
    return await _productRepository.changeOnlineInventoryStatus(id, action);
  }

  //在线盘点单操作记录列表
  Future<void> getOnlineOperationLogList(int id) async {
    var listDynamic = await _productRepository.getOnlineOperationLogList(id);
    operationLogList.value = (listDynamic as List<dynamic>).map((e) {
      return e;
    }).toList();
  }

  checkStatus(int status) {
    switch (status) {
      case 0:
        return '录入中';
      case 1:
        return '已盘点';
      case 2:
        return '已作废';
      case 3:
        return '已确认';
      default:
        return '未知';
    }
  }

  restoreScan(int id) async {
    var inventoryMap = await _productRepository.getOnlineInventoryDetail(id);
    var x = Inventory();
    x.shopId = inventoryMap['shopId'];
    x.userId = inventoryMap['createUser'];
    x.documentCode = inventoryMap['documentCode'];
    x.documentId = inventoryMap['id'];
    x.checkTime = inventoryMap['checkTime'];
    x.createTime = inventoryMap['createTime'];
    x.prodTotal = inventoryMap['prodTotal'];
    x.status = inventoryMap['status'];
    x.total = inventoryMap['total'];
    x.remark = inventoryMap['remark'];
    var codes = (inventoryMap['details'] as List<dynamic>).map((e) {
      return e['prodCode'];
    }).toList();
    var prods = <ProductData>[];
    for (var element in codes) {
      prods.add(
          await _productRepository.getSingleProd(element) ?? ProductData());
    }
    x.inventoryList = (inventoryMap['details'] as List<dynamic>).map((e) {
      var spd = OnlineSingleProdInventory();
      var sp = ProductData();
      sp = prods.firstWhere((element) => element.prodCode == e['prodCode']);
      spd.prodCode = e['prodCode'];
      spd.prodName = sp.prodName ?? '';
      spd.catName = sp.catName ?? '';
      spd.speName = sp.speName ?? '';
      spd.codeThumbnail = sp.codeThumbnail ?? '';
      spd.styleId = sp.styleId ?? 0;
      spd.codeId = sp.codeId ?? 0;
      spd.styleThumbnail = sp.styleThumbnail ?? '';
      spd.typeName = sp.typeName ?? '';
      spd.yearName = sp.yearName ?? '';
      spd.num = e['num']!;
      spd.onlineNum = e['prodCount'] ??
          c.onlineInventoryList
              .firstWhere((element) => element.prodCode == e['prodCode'])
              .onlineNum;
      spd.diffNum = spd.num! - spd.onlineNum!;
      return spd;
    }).toList();
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
    c.recordStatus.value = 3;
    c.manualInputController.value.text = (singleProd.num).toString();
  }

  filterInventory() {
    inventoryList.value = inventoryList.where((element) {
      return (idCtrl.value.text.isNotEmpty
              ? (element.documentCode!).toString().contains(idCtrl.value.text)
              : true) &&
          (remarkCtrl.value.text.isNotEmpty
              ? (element.remark ?? '').contains(remarkCtrl.value.text)
              : true) &&
          (status.value != 5 ? (element.status!) == status.value : true) &&
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
    statusCtrl.value.text = '';
    status.value = 5;
    getOnlineInventoryList();
  }

  changeTime(x, y) {
    startTime.value = DateFormat('yyyy-MM-dd').format(x);
    endTime.value = DateFormat('yyyy-MM-dd').format(y);
    timeCtrl.value.text = '${startTime.value}~${endTime.value}';
  }

  changeSatatus(x) {
    status.value = checkStatusReverse(x);
    statusCtrl.value.text = x;
  }

  checkStatusReverse(String statusName) {
    switch (statusName) {
      case '录入中':
        return 0;
      case '已盘点':
        return 1;
      case '已作废':
        return 2;
      case '已确认':
        return 3;
      default:
        return 5;
    }
  }
}
