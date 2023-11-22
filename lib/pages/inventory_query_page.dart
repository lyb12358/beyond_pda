import 'package:beyond_pda/controller/inventory_query_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:sm_scan/shangmi_util.dart';

import '../controller/user_controller.dart';

class InventoryQueryPage extends GetView<InventoryQueryController> {
  const InventoryQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InventoryQueryController());
    UserController c = Get.find();
    final GetStorage box = GetStorage();
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };
    var isSupply = (c.operations.firstWhere((element) =>
                element['operationType'] ==
                'directInventory:view')['columnPermissions'] ??
            [])
        .any((element) => element['columnName'] == 'supplyPrice');
    return Obx(() => Scaffold(
          body: controller.inventoryList.isEmpty
              ? Center(
                  child: BrnAbnormalStateWidget(
                  img: Image.asset(
                    'assets/images/no_data.png',
                    scale: 3.0,
                  ),
                  content: '请点击右下角按钮输入搜索条件',
                ))
              : ListView.builder(
                  itemCount: controller.inventoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: -2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ExpansionTile(
                        title: Text(
                            '${controller.inventoryList[index]['prodName']!}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '编号：${controller.inventoryList[index]['prodCode']!}'),
                            Text(
                                '规格：${controller.inventoryList[index]['speName'] ?? ''}'),
                            Text(
                                '可用库存：${controller.inventoryList[index]['prodCount']!}'),
                            Text(
                                '门店：${controller.inventoryList[index]['shopCode']!}-${controller.inventoryList[index]['shopName']!}'),
                          ],
                        ),
                        leading: Image.network(
                          c.calImageUrlByMap(controller.inventoryList[index]),
                          headers: headersMap,
                          fit: BoxFit.cover,
                        ),
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40, bottom: 10),
                            child: BrnPairInfoTable(
                              isValueAlign: true,
                              rowDistance: 8,
                              itemSpacing: 30,
                              children: [
                                BrnInfoModal(
                                  keyPart: Text('年份:',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  valuePart: Text(
                                      '${controller.inventoryList[index]['yearName'] ?? ''}'),
                                ),
                                BrnInfoModal(
                                  keyPart: Text('属性:',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  valuePart: Text(
                                      '${controller.inventoryList[index]['attrName'] ?? ''}'),
                                ),
                                BrnInfoModal(
                                    keyPart: Text('类别:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(
                                        '${controller.inventoryList[index]['familyName'] ?? ''}-${controller.inventoryList[index]['typeName'] ?? ''}-${controller.inventoryList[index]['bigName'] ?? ''}-${controller.inventoryList[index]['middleName'] ?? ''}-${controller.inventoryList[index]['smallName'] ?? ''}')),
                                BrnInfoModal(
                                    keyPart: Text('品类:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller
                                            .inventoryList[index]['catName'] ??
                                        '')),
                                BrnInfoModal(
                                    keyPart: Text('材质:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller
                                            .inventoryList[index]['prodMat'] ??
                                        '')),
                                BrnInfoModal(
                                    keyPart: Text('克重:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(
                                        controller.inventoryList[index]
                                                ['newWeight'] ??
                                            '')),
                                BrnInfoModal(
                                    keyPart: Text('零售价:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller
                                        .inventoryList[index]['retailPrice']
                                        .toString())),
                                BrnInfoModal(
                                    keyPart: Text('供应价:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Visibility(
                                      visible: !isSupply,
                                      child: Text(controller
                                          .inventoryList[index]['supplyPrice']
                                          .toString()),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.search_outlined),
            onPressed: () {
              BrnDialogManager.showConfirmDialog(context,
                  title: "库存搜索",
                  cancel: '重置',
                  confirm: '搜索',
                  barrierDismissible: false,
                  messageWidget: Column(
                    children: [
                      BrnTextInputFormItem(
                        controller: controller.codeCtrl.value,
                        title: "产品编号",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                      BrnTextInputFormItem(
                        controller: controller.nameCtrl.value,
                        title: "产品名称",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                      BrnTextInputFormItem(
                        controller: controller.spCodeCtrl.value,
                        title: "门店编号",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                      BrnTextInputFormItem(
                        controller: controller.spNameCtrl.value,
                        title: "门店名称",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                      BrnRadioInputFormItem(
                        title: "隐藏零库存",
                        options: const [
                          "是",
                          "否",
                        ],
                        value: controller.prodCountStatusLabel.value,
                        onChanged: (oldValue, newValue) {
                          controller.checkStatus(newValue);
                        },
                      ),
                    ],
                  ), onConfirm: () async {
                Navigator.pop(context);
                BrnLoadingDialog.show(context, barrierDismissible: false);
                //门店编号强制大写
                controller.spCodeCtrl.value.text =
                    controller.spCodeCtrl.value.text.toUpperCase();
                await controller.inventoryQuery();
                BrnLoadingDialog.dismiss(context);
                //不知道为什么没用
                //ShangMiScanUtil().cancel();
              }, onCancel: () async {
                Navigator.pop(context);
                BrnLoadingDialog.show(context, barrierDismissible: false);
                await controller.resetForm();
                BrnLoadingDialog.dismiss(context);
                //ShangMiScanUtil().cancel();
              });
            },
          ),
        ));
  }
}
