import 'package:beyond_pda/models/inventory.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart';
import 'user_controller.dart';

class HistoricRecordController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  //盘点列表
  Future<void> getOnlineInventory() async {
    var listDynamic = await _productRepository.getInventoryList(c.shopId.value);
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
}
