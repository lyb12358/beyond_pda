import 'package:beyond_pda/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChooseShopController extends GetxController {
  final shopList = [].obs;
  GetStorage box = GetStorage();
  late UserController c;

  @override
  void onInit() async {
    super.onInit();
    c = Get.find();
    shopList.value = await c.getShopList();
  }

  void chooseShop(Map map) {
    c.brandId.value = map['brandId'];
    box.write('brandId', map['brandId']);
    c.shopId.value = map['id'];
    box.write('shopId', map['id']);
    c.shopNo.value = map['shopNo'];
    box.write('shopNo', map['shopNo']);
    c.shopName.value = map['shopName'];
    box.write('shopName', map['shopName']);
  }
}
