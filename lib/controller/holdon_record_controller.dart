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
    c.codeList.value = x.inventoryList ?? [];
    c.currentProd.value = x.inventoryList?[0] ?? OnlineSingleProdInventory();
    c.inventory.value = x;
  }
}
