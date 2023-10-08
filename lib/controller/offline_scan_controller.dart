import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/inventory.dart';
import '../models/product_data.dart';
import '../repository/product_repository.dart';
//import 'package:get_storage/get_storage.dart';

class OfflineScanController extends GetxController {
  final codeList = <OnlineSingleProdInventory>[].obs;
  final filteredCodeList = <OnlineSingleProdInventory>[].obs;
  final inventory = Inventory().obs;
  //扫码界面搜索框
  final searchCtrl = TextEditingController().obs;
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
    //ever(codeList, (_) => filterList());
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
    //check visible
    if (searchCtrl.value.text.isNotEmpty) {
      if ((spd.prodCode!).contains(searchCtrl.value.text) ||
          (spd.prodName ?? '').contains(searchCtrl.value.text)) {
        spd.visible = true;
      } else {
        spd.visible = false;
      }
    } else {
      spd.visible = true;
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
    searchCtrl.value.text = '';
    codeList.value = [];
    inventory.value = Inventory();
  }

  // filterList() {
  //   if (searchCtrl.value.text.isNotEmpty) {
  //     filteredCodeList.value = codeList.where((element) {
  //       return ((element.prodCode!).contains(searchCtrl.value.text) ||
  //           (element.prodName ?? '').contains(searchCtrl.value.text));
  //     }).toList();
  //   } else {
  //     filteredCodeList.value = codeList;
  //   }
  // }

  // resetSearch() {
  //   searchCtrl.value.text = '';
  //   filterList();
  // }
  filterList() {
    if (searchCtrl.value.text.isNotEmpty) {
      codeList.value = codeList.map((element) {
        if ((element.prodCode!).contains(searchCtrl.value.text) ||
            (element.prodName ?? '').contains(searchCtrl.value.text)) {
          element.visible = true;
        } else {
          element.visible = false;
        }
        return element;
      }).toList();
    } else {
      codeList.value = codeList.map((element) {
        element.visible = true;
        return element;
      }).toList();
    }
  }

  resetSearch() {
    searchCtrl.value.text = '';
    filterList();
  }
}
