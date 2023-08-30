import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';

class OnlineScanController extends GetxController {
  final codeList = <SingleProdInventory>[].obs;

  static OnlineScanController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
  }

  void addCode(String code) {
    if (checkCodeExist(code)) {
      int i = codeList.indexWhere((element) => element.code == code);
      SingleProdInventory spd = codeList[i];
      int num = spd.num;
      if (i == 0) {
        codeList[0] = SingleProdInventory(code, num + 1);
      } else {
        codeList.removeAt(i);
        codeList.insert(0, SingleProdInventory(code, num + 1));
      }
    } else {
      codeList.insert(0, SingleProdInventory(code, 1));
    }
  }

  void setCode(String code, int num) {
    if (checkCodeExist(code)) {
      int i = codeList.indexWhere((element) => element.code == code);
      if (i == 0) {
        codeList[0] = SingleProdInventory(code, num);
      } else {
        codeList.removeAt(i);
        codeList.insert(0, SingleProdInventory(code, num));
      }
    } else {
      codeList.insert(0, SingleProdInventory(code, num));
    }
  }

  bool checkCodeExist(String code) {
    if (codeList.isEmpty) {
      return false;
    }
    return codeList.any((element) => element.code == code);
  }
}

class SingleProdInventory {
  String code;
  int num;
  SingleProdInventory(this.code, this.num);
}
