import 'package:beyond_pda/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart';

class ProdQueryController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;

  final prodList = [].obs;
  final searchForm = {}.obs;
  final page = 1.obs;
  final limit = 10.obs;
  final prodClass = [].obs;
  //搜索框
  final codeCtrl = TextEditingController().obs;
  final nameCtrl = TextEditingController().obs;
  final yearCtrl = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
    //prodClass.value = await _productRepository.getProdClass();
  }

  //产品查询
  Future<void> getOnlineProdList() async {
    searchForm['page'] = page.value;
    searchForm['limit'] = limit.value;
    searchForm['prodCode'] = codeCtrl.value.text;
    searchForm['prodName'] = nameCtrl.value.text;
    searchForm['yearName'] = yearCtrl.value.text;
    searchForm.refresh();
    var listDynamic = await _productRepository.getOnlineProdList(searchForm);
    prodList.value = (listDynamic as List<dynamic>).map((e) {
      return e;
    }).toList();
  }

  resetForm() async {
    codeCtrl.value.text = '';
    nameCtrl.value.text = '';
    yearCtrl.value.text = '';
    page.value = 1;
    limit.value = 10;
    searchForm.value = {};
    searchForm.refresh();
    await getOnlineProdList();
  }
}
