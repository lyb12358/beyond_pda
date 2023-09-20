import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:get/get.dart';

import '../models/inventory.dart';
import '../repository/product_repository.dart';

class OfflineRecordController extends GetxController {
  OfflineScanController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
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
}
