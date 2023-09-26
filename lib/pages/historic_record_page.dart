import 'package:beyond_pda/controller/historic_record_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'online_scan_page.dart';

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
                return Visibility(
                  visible: controller.inventoryList[index].status != 2,
                  child: ExpansionTile(
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
                              keyPart: Text('库存数量:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text('${c.calTotalOnlineNum()}'),
                            ),
                            BrnInfoModal(
                              keyPart: Text('差异:',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              valuePart: Text(
                                  '${controller.inventoryList[index].total! - c.calTotalOnlineNum()}'),
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
                            onTap: () async {
                              BrnDialogManager.showConfirmDialog(context,
                                  title: "确定查看明细吗，只有录入状态单据才能继续盘点",
                                  cancel: '取消',
                                  confirm: '确定', onConfirm: () async {
                                Navigator.pop(context);
                                BrnLoadingDialog.show(context,
                                    barrierDismissible: false);
                                await controller.restoreScan(controller
                                    .inventoryList[index].documentId!);
                                await c.getOnlineInventory();
                                BrnLoadingDialog.dismiss(context);
                                Get.off(() => const OnlineScanPage());
                              }, onCancel: () {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          BrnSmallOutlineButton(
                            title: '日志',
                            width: 60,
                            onTap: () async {
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              await controller.getOnlineOperationLogList(
                                  controller.inventoryList[index].documentId!);
                              BrnLoadingDialog.dismiss(context);
                              BrnDialogManager.showSingleButtonDialog(context,
                                  //showIcon: false,
                                  title: "操作日志",
                                  messageWidget: Container(
                                    height: 500,
                                    child: ListView.builder(
                                        itemCount:
                                            controller.operationLogList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                                controller
                                                        .operationLogList[index]
                                                    ['operation']!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                        '操作人：${controller.operationLogList[index]['createUserName']!}'),
                                                    Text(
                                                        '操作时间：${controller.operationLogList[index]['createTime']!}'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                  label: "关闭", onTap: () {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          if ((controller.inventoryList[index].status ?? 0) ==
                              0)
                            BrnSmallOutlineButton(
                              title: '作废',
                              width: 60,
                              textColor: Colors.red,
                              onTap: () {
                                BrnDialogManager.showConfirmDialog(context,
                                    title: "确定作废该单据？",
                                    cancel: '取消',
                                    confirm: '确定', onConfirm: () async {
                                  Navigator.pop(context);
                                  BrnLoadingDialog.show(context,
                                      barrierDismissible: false);
                                  if (await controller
                                      .changeOnlineInventoryStatus(
                                          controller
                                              .inventoryList[index].documentId!,
                                          2)) {
                                    BrnToast.show("操作成功", context);
                                    await controller.getOnlineInventoryList();
                                  } else {
                                    BrnToast.show("操作失败", context);
                                  }
                                  BrnLoadingDialog.dismiss(context);
                                }, onCancel: () {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          Visibility(
                            visible:
                                (controller.inventoryList[index].status ?? 0) ==
                                    0,
                            child: BrnSmallOutlineButton(
                              title: '确认',
                              width: 60,
                              onTap: () {
                                BrnDialogManager.showConfirmDialog(context,
                                    title: "将确认该单据",
                                    cancel: '否',
                                    confirm: '是', onConfirm: () async {
                                  Navigator.pop(context);
                                  BrnLoadingDialog.show(context,
                                      barrierDismissible: false);
                                  if (await controller
                                      .changeOnlineInventoryStatus(
                                          controller
                                              .inventoryList[index].documentId!,
                                          3)) {
                                    BrnToast.show("操作成功", context);
                                    await controller.getOnlineInventoryList();
                                  } else {
                                    BrnToast.show("操作失败", context);
                                  }
                                  BrnLoadingDialog.dismiss(context);
                                }, onCancel: () {
                                  Navigator.pop(context);
                                });
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
                                BrnDialogManager.showConfirmDialog(context,
                                    title: "将取消确认该单据",
                                    cancel: '否',
                                    confirm: '是', onConfirm: () async {
                                  Navigator.pop(context);
                                  BrnLoadingDialog.show(context,
                                      barrierDismissible: false);
                                  if (await controller
                                      .changeOnlineInventoryStatus(
                                          controller
                                              .inventoryList[index].documentId!,
                                          -3)) {
                                    BrnToast.show("操作成功", context);
                                    await controller.getOnlineInventoryList();
                                  } else {
                                    BrnToast.show("操作失败", context);
                                  }
                                  BrnLoadingDialog.dismiss(context);
                                }, onCancel: () {
                                  Navigator.pop(context);
                                });
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
                                BrnDialogManager.showConfirmDialog(context,
                                    title: "是否盘点该单据",
                                    cancel: '否',
                                    confirm: '是', onConfirm: () async {
                                  Navigator.pop(context);
                                  BrnLoadingDialog.show(context,
                                      barrierDismissible: false);
                                  if (await controller
                                      .changeOnlineInventoryStatus(
                                          controller
                                              .inventoryList[index].documentId!,
                                          1)) {
                                    BrnToast.show("操作成功", context);
                                    await controller.getOnlineInventoryList();
                                  } else {
                                    BrnToast.show("操作失败", context);
                                  }
                                  BrnLoadingDialog.dismiss(context);
                                }, onCancel: () {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
