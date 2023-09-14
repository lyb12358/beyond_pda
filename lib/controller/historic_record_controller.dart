import 'package:beyond_pda/models/inventory.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart';
import 'user_controller.dart';

class HistoricRecordController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;
  final inventoryList = <Inventory>[].obs;
  final operationLogList = [].obs;
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
}
