import 'package:beyond_pda/controller/user.dart';
import 'package:get/get.dart';

class ChooseShopController extends GetxController {
  final shopList = [].obs;
  final shopId = 0.obs;
  final shopName = ''.obs;
  final shopNo = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    UserController c = Get.find();
    shopList.value = await c.getShopList();
  }
}
