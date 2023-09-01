import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/models/product_data.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';

class OnlineScanController extends GetxController {
  UserController c = Get.find();
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String calImageUrl() {
    ProductData prod = c.singleProd.value;
    String baseLocation = c.tempBaseUrl;
    String codeLocation = "/image/code/";
    String matLocation = "/image/mat/";
    if ((prod.codeThumbnail ?? '').isEmpty) {
      return '$baseLocation/template/noImage.jpg';
    } else if ((prod.styleId ?? 0) != 0) {
      return '$baseLocation$codeLocation${prod.codeId}/${prod.codeThumbnail}';
    } else {
      return '$baseLocation$matLocation${prod.codeId}/${prod.codeThumbnail}';
    }
  }
}
