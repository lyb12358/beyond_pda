import 'package:beyond_pda/controller/choose_shop_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class ChooseShopPage extends GetView<ChooseShopController> {
  const ChooseShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChooseShopController());
    UserController c = Get.find();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('选择门店'),
          ),
          body: ListView.builder(
              itemCount: controller.shopList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.shopList[index]['shopName']),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(controller.shopList[index]['shopNo']),
                        ],
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 22,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    BrnDialogManager.showConfirmDialog(context,
                        title: "确定选择${controller.shopList[index]['shopName']}吗",
                        cancel: '取消',
                        confirm: '确定', onConfirm: () async {
                      Navigator.pop(context);
                      BrnLoadingDialog.show(context, barrierDismissible: false);
                      c.chooseShop(controller.shopList[index]);
                      BrnLoadingDialog.dismiss(context);
                      Get.back();
                    }, onCancel: () {
                      Navigator.pop(context);
                    });
                  },
                );
              }),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.search_outlined),
            onPressed: () {
              BrnDialogManager.showConfirmDialog(context,
                  title: "门店搜索",
                  cancel: '重置',
                  confirm: '搜索',
                  messageWidget: Column(
                    children: [
                      BrnTextInputFormItem(
                        controller: controller.spCtrl.value,
                        title: "编号/名称",
                        hint: "请输入",
                        maxCharCount: 50,
                        onChanged: (newValue) {},
                      ),
                    ],
                  ), onConfirm: () async {
                Navigator.pop(context);
                await controller.filterShop();
              }, onCancel: () async {
                Navigator.pop(context);
                await controller.resetForm();
              });
            },
          ),
        ));
  }
}
