import 'package:beyond_pda/controller/historic_record_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class HistoricRecordPage extends GetView<HistoricRecordController> {
  const HistoricRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('历史盘点'),
          ),
          body: ListView.builder(
              itemCount: controller.inventoryList.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                      '盘点单号：${controller.inventoryList[index].documentCode!}'),
                  subtitle: Text(
                      '创建时间：${controller.inventoryList[index].createTime ?? ''}'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 10),
                      child: BrnPairInfoTable(
                        isValueAlign: true,
                        rowDistance: 8,
                        itemSpacing: 30,
                        children: [
                          BrnInfoModal(
                            keyPart: Text('盘点个数:',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            valuePart: Text(
                                '${controller.inventoryList[index].prodTotal ?? 0}'),
                          ),
                          BrnInfoModal(
                            keyPart: Text('盘点数量:',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            valuePart: Text(
                                '${controller.inventoryList[index].total ?? 0}'),
                          ),
                          BrnInfoModal(
                              keyPart: Text('盘点时间:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text(
                                  controller.inventoryList[index].checkTime ??
                                      '')),
                          BrnInfoModal(
                              keyPart: Text('备注:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text(
                                  controller.inventoryList[index].remark ??
                                      '')),
                          BrnInfoModal(
                              keyPart: Text('状态:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text(
                                  '${controller.checkStatus(controller.inventoryList[index].status ?? 0)}')),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      overflowDirection: VerticalDirection.down,
                      children: [
                        BrnSmallOutlineButton(
                          title: '明细',
                          width: 60,
                          onTap: () {
                            BrnToast.show('次按钮', context);
                          },
                        ),
                        BrnSmallOutlineButton(
                          title: '日志',
                          width: 60,
                          onTap: () {
                            BrnToast.show('次按钮', context);
                          },
                        ),
                        Visibility(
                          visible:
                              (controller.inventoryList[index].status ?? 0) ==
                                  0,
                          child: BrnSmallOutlineButton(
                            title: '作废',
                            width: 60,
                            textColor: Colors.red,
                            onTap: () {
                              BrnToast.show('次按钮', context);
                            },
                          ),
                        ),
                        Visibility(
                          visible:
                              (controller.inventoryList[index].status ?? 0) ==
                                  0,
                          child: BrnSmallOutlineButton(
                            title: '确认',
                            width: 60,
                            onTap: () {
                              BrnToast.show('次按钮', context);
                            },
                          ),
                        ),
                        Visibility(
                          visible:
                              (controller.inventoryList[index].status ?? 0) ==
                                  3,
                          child: BrnSmallOutlineButton(
                            title: '取消确认',
                            width: 80,
                            onTap: () {
                              BrnToast.show('次按钮', context);
                            },
                          ),
                        ),
                        Visibility(
                          visible:
                              (controller.inventoryList[index].status ?? 0) ==
                                  3,
                          child: BrnSmallMainButton(
                            title: '盘点',
                            width: 60,
                            onTap: () async {
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              await controller.getOnlineInventoryList();
                              BrnLoadingDialog.dismiss(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ));
  }
}
