import 'package:beyond_pda/controller/holdon_record_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import 'online_scan_page.dart';

class HoldonRecordPage extends GetView<HoldonRecordController> {
  const HoldonRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('盘点挂单'),
          ),
          body: ListView.builder(
              itemCount: controller.inventoryList.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text('挂单号：${controller.inventoryList[index].id!}'),
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
                              keyPart: Text('备注:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text(
                                  controller.inventoryList[index].remark ??
                                      '')),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      overflowDirection: VerticalDirection.down,
                      children: [
                        BrnSmallOutlineButton(
                          title: '删除',
                          width: 60,
                          textColor: Colors.red,
                          onTap: () {
                            BrnDialogManager.showConfirmDialog(context,
                                title: "确定删除该挂单？",
                                cancel: '取消',
                                confirm: '确定', onConfirm: () async {
                              Navigator.pop(context);
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              if (await c.deleteHoldonInventory(
                                  controller.inventoryList[index].id ?? 0)) {
                                BrnToast.show("操作成功", context);
                                await controller.getHoldonInventoryList();
                              } else {
                                BrnToast.show("操作失败", context);
                              }
                              BrnLoadingDialog.dismiss(context);
                            }, onCancel: () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        BrnSmallMainButton(
                          title: '继续盘点',
                          width: 90,
                          onTap: () {
                            BrnDialogManager.showConfirmDialog(context,
                                title: "确定继续盘点吗？",
                                cancel: '取消',
                                confirm: '确定', onConfirm: () async {
                              Navigator.pop(context);
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              await c.getOnlineInventory();
                              controller
                                  .restoreScan(controller.inventoryList[index]);
                              BrnLoadingDialog.dismiss(context);
                              Get.off(() => const OnlineScanPage());
                            }, onCancel: () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        BrnSmallMainButton(
                          title: '同步',
                          width: 60,
                          onTap: () {
                            BrnDialogManager.showConfirmDialog(context,
                                title: "确定同步到博洋云店吗？",
                                cancel: '取消',
                                confirm: '确定', onConfirm: () async {
                              Navigator.pop(context);
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              if (await c.syncOnlineInventory(
                                  controller.inventoryList[index])) {
                                c.deleteHoldonInventory(
                                    controller.inventoryList[index].id ?? 0);
                              }
                              BrnLoadingDialog.dismiss(context);
                              BrnToast.show("操作成功", context);
                            }, onCancel: () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ));
  }
}
