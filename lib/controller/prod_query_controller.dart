import 'package:beyond_pda/controller/user_controller.dart';
import 'package:get/get.dart';

import '../repository/product_repository.dart';

class ProdQueryController extends GetxController {
  UserController c = Get.find();
  late ProductRepository _productRepository;

  final prodList = [].obs;
  final searchForm = {}.obs;

  @override
  void onInit() async {
    super.onInit();
    _productRepository = Get.find();
    searchForm['page'] = 1;
    searchForm['row'] = 10;
    await getOnlineProdList();
  }

  //产品查询
  Future<void> getOnlineProdList() async {
    var listDynamic = await _productRepository.getOnlineProdList(searchForm);
    prodList.value = (listDynamic as List<dynamic>).map((e) {
      return e;
    }).toList();
  }
}
