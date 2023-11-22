import 'package:beyond_pda/controller/user_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_scan/shangmi_util.dart';

import '../repository/product_repository.dart';

class ProdQueryController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;

  final prodList = [].obs;
  final searchForm = {}.obs;
  final page = 1.obs;
  final limit = 50.obs;
  final prodClass = BrnPickerEntity();
  //搜索框
  final codeCtrl = TextEditingController().obs;
  final nameCtrl = TextEditingController().obs;
  final yearCtrl = TextEditingController().obs;
  final classCtrl = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
    await getProdClass();
    ShangMiScanUtil().listen((value) {
      debugPrint("产品查询快捷编号输入");
      codeCtrl.value.text = value;
      getOnlineProdList();
    });
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
    classCtrl.value.text = '';
    page.value = 1;
    limit.value = 50;
    searchForm.value = {};
    searchForm.refresh();
    await getOnlineProdList();
  }

  //获取类别树
  Future<void> getProdClass() async {
    var listDynamic = await _productRepository.getProdClass();
    // prodClass.uniqueId = '0';
    prodClass.value = '0';
    // prodClass.defaultValue = '';
    prodClass.type = 'radio';
    //prodClass.filterType = PickerFilterType.radio;
    prodClass.key = '0';
    prodClass.name = 'xx';
    prodClass.children = [
      ...(listDynamic as List<dynamic>).map((o) => newFromMap(o))
    ];
  }

  BrnPickerEntity newFromMap(Map<String, dynamic>? map) {
    if (map == null) return BrnPickerEntity();
    BrnPickerEntity entity = BrnPickerEntity();
    // entity.uniqueId = map['id']!.toString();
    // entity.defaultValue = '';
    entity.name = map['label'] ?? "";
    entity.key = map['value']!.toString();
    entity.type = 'radio';
    //entity.filterType = PickerFilterType.radio;
    entity.value = map['value']!.toString();
    entity.children = []
      ..addAll((map['children'] as List? ?? []).map((o) => newFromMap(o)));
    return entity;
  }

  changeClass(int index, String key, String name) {
    if (index == 0) {
      searchForm['prodFamily'] = key;
    } else if (index == 1) {
      searchForm['prodType'] = key;
    } else {
      searchForm['bigType'] = key;
    }
    classCtrl.value.text = name;
  }
}
