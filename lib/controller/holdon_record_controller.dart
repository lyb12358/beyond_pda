import 'package:beyond_pda/controller/user_controller.dart';
import 'package:get/get.dart';

import '../models/inventory.dart';
import '../repository/product_repository.dart';

class HoldonRecordController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
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
}
