import 'package:beyond_pda/controller/prod_query_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/user_controller.dart';

class ProdQueryPage extends GetView<ProdQueryController> {
  const ProdQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProdQueryController());
    UserController c = Get.find();
    final GetStorage box = GetStorage();
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };
    var isSupply = (c.operations.firstWhere((element) =>
                element['operationType'] ==
                'productList:view')['columnPermissions'] ??
            [])
        .any((element) => element['columnName'] == 'supplyPrice');
    return Obx(() => Scaffold(
          body: controller.prodList.isEmpty
              ? Center(
                  child: BrnAbnormalStateWidget(
                  img: Image.asset(
                    'assets/images/no_data.png',
                    scale: 3.0,
                  ),
                  content: '请点击右下角按钮输入搜索条件',
                ))
              : ListView.builder(
                  itemCount: controller.prodList.length,
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
                        title:
                            Text('${controller.prodList[index]['prodName']!}'),
                        subtitle: Text(
                            '编号：${controller.prodList[index]['prodCode']!}'),
                        leading: Image.network(
                          c.calImageUrlByMap(controller.prodList[index]),
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
                                      '${controller.prodList[index]['yearName'] ?? ''}'),
                                ),
                                BrnInfoModal(
                                  keyPart: Text('属性:',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                  valuePart: Text(
                                      '${controller.prodList[index]['attrName'] ?? ''}'),
                                ),
                                BrnInfoModal(
                                    keyPart: Text('类别:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(
                                        '${controller.prodList[index]['familyName'] ?? ''}-${controller.prodList[index]['typeName'] ?? ''}-${controller.prodList[index]['bigName'] ?? ''}-${controller.prodList[index]['middleName'] ?? ''}-${controller.prodList[index]['smallName'] ?? ''}')),
                                BrnInfoModal(
                                    keyPart: Text('品类:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller.prodList[index]
                                            ['catName'] ??
                                        '')),
                                BrnInfoModal(
                                    keyPart: Text('材质:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller.prodList[index]
                                            ['prodMat'] ??
                                        '')),
                                BrnInfoModal(
                                    keyPart: Text('克重:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller.prodList[index]
                                            ['newWeight'] ??
                                        '')),
                                BrnInfoModal(
                                    keyPart: Text('零售价:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Text(controller.prodList[index]
                                            ['retailPrice']
                                        .toString())),
                                BrnInfoModal(
                                    keyPart: Text('供应价:',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    valuePart: Visibility(
                                      visible: !isSupply,
                                      child: Text(controller.prodList[index]
                                              ['supplyPrice']
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
            child: const Icon(Icons.add),
            onPressed: () {
              BrnDialogManager.showConfirmDialog(context,
                  title: "产品搜索",
                  cancel: '重置',
                  confirm: '搜索',
                  messageWidget: Column(
                    children: [
                      BrnTextInputFormItem(
                        controller: controller.codeCtrl.value,
                        title: "编号",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                      BrnTextInputFormItem(
                        controller: controller.nameCtrl.value,
                        title: "名称",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                    ],
                  ), onConfirm: () {
                Navigator.pop(context);
                controller.getOnlineProdList();
              }, onCancel: () {
                Navigator.pop(context);
              });
            },
          ),
        ));
  }
}
