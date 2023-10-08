import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart';
import 'user_controller.dart';

class InventoryQueryController extends GetxController {
  late ProductRepository _productRepository;
  UserController c = Get.find();
  final inventoryList = [].obs;
  final searchForm = {}.obs;
  final page = 1.obs;
  final limit = 50.obs;
  final prodCountStatus = 3.obs;
  final prodClass = [].obs;
  //搜索框
  final codeCtrl = TextEditingController().obs;
  final nameCtrl = TextEditingController().obs;
  final spCodeCtrl = TextEditingController().obs;
  final spNameCtrl = TextEditingController().obs;
  final prodCountStatusLabel = '是'.obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
    await checkShop();
  }

  //库存查询
  Future<void> inventoryQuery() async {
    searchForm['page'] = page.value;
    searchForm['limit'] = limit.value;
    searchForm['prodCountStatus'] = prodCountStatus.value;
    searchForm['prodCode'] = codeCtrl.value.text;
    searchForm['prodName'] = nameCtrl.value.text;
    searchForm['shopCode'] = spCodeCtrl.value.text;
    searchForm['shopName'] = spNameCtrl.value.text;
    searchForm.refresh();
    var listDynamic = await _productRepository.inventoryQuery(searchForm);
    inventoryList.value = (listDynamic as List<dynamic>).map((e) {
      return e;
    }).toList();
  }

  resetForm() async {
    codeCtrl.value.text = '';
    nameCtrl.value.text = '';
    spCodeCtrl.value.text = '';
    spNameCtrl.value.text = '';
    prodCountStatus.value = 3;
    prodCountStatusLabel.value = '是';
    page.value = 1;
    limit.value = 50;
    searchForm.value = {};
    searchForm.refresh();
    await inventoryQuery();
  }

  checkStatus(val) {
    if (val == '是') {
      prodCountStatus.value = 3;
      prodCountStatusLabel.value = '是';
    } else {
      prodCountStatus.value = 2;
      prodCountStatusLabel.value = '否';
    }
  }

  checkShop() async {
    if (c.shopId.value != 0) {
      searchForm['departId'] = c.departId.value;
      var x = [];
      x.add(c.shopId.value);
      searchForm['shopIds'] = x;
      await inventoryQuery();
    }
  }
}
