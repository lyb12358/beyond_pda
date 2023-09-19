import 'package:get/get.dart';

import '../repository/product_repository.dart';

class InventoryQueryController extends GetxController {
  late ProductRepository _productRepository;

  final inventoryList = [].obs;
  final searchForm = {}.obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
    searchForm['page'] = 1;
    searchForm['limit'] = 10;
    searchForm['prodCountStatus'] = 3;
    await inventoryQuery();
  }

  //产品查询
  Future<void> inventoryQuery() async {
    var listDynamic = await _productRepository.inventoryQuery(searchForm);
    inventoryList.value = (listDynamic as List<dynamic>).map((e) {
      return e;
    }).toList();
  }
}
