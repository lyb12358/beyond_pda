import 'package:get/get.dart';

import '../models/product_data.dart';
import '../repository/product_repository.dart';
//import 'package:get_storage/get_storage.dart';

class OfflineScanController extends GetxController {
  final codeList = <SingleProdInventory>[].obs;

  static OfflineScanController get to => Get.find();
  late ProductRepository _productRepository;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
  }

  Future<void> addCode(String code) async {
    String name = (await getSingleProd(code)).prodName ?? '';
    if (checkCodeExist(code)) {
      int i = codeList.indexWhere((element) => element.code == code);
      SingleProdInventory spd = codeList[i];
      int num = spd.num;
      if (i == 0) {
        codeList[0] = SingleProdInventory(code, name, num + 1);
      } else {
        codeList.removeAt(i);
        codeList.insert(0, SingleProdInventory(code, name, num + 1));
      }
    } else {
      codeList.insert(0, SingleProdInventory(code, name, 1));
    }
  }

  Future<void> setCode(String code, int num) async {
    String name = (await getSingleProd(code)).prodName ?? '';
    if (checkCodeExist(code)) {
      int i = codeList.indexWhere((element) => element.code == code);
      if (i == 0) {
        codeList[0] = SingleProdInventory(code, name, num);
      } else {
        codeList.removeAt(i);
        codeList.insert(0, SingleProdInventory(code, name, num));
      }
    } else {
      codeList.insert(0, SingleProdInventory(code, name, num));
    }
  }

  bool checkCodeExist(String code) {
    if (codeList.isEmpty) {
      return false;
    }
    return codeList.any((element) => element.code == code);
  }

  //查询产品
  Future<ProductData> getSingleProd(String code) async {
    return await _productRepository.getSingleProd(code) ?? ProductData();
  }
}

class SingleProdInventory {
  String code;
  String prodName;
  int num;
  SingleProdInventory(this.code, this.prodName, this.num);
}
