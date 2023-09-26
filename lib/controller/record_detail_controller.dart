import 'package:get/get.dart';

import 'user_controller.dart';

class RecordDetailController extends GetxController {
  UserController c = Get.find();
  final totalNum = 0.obs;
  final totalOnlineNum = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    calTotalNum();
    calTotalOnlineNum();
    ever(c.codeList, (_) => calTotalNum());
  }

  calTotalNum() {
    totalNum.value = 0;
    for (var item in c.codeList) {
      totalNum.value = totalNum.value + (item.num ?? 0);
    }
  }

  calTotalOnlineNum() {
    totalOnlineNum.value = 0;
    for (var item in c.onlineInventoryList) {
      totalOnlineNum.value = totalOnlineNum.value + (item.onlineNum ?? 0);
    }
  }

  String calPageName() {
    switch (c.recordStatus.value) {
      case 1:
        return '在线盘点明细';
      case 2:
        return '挂单盘点明细';
      case 3:
        return '历史盘点明细';
      default:
        return '未知标题';
    }
  }
}
