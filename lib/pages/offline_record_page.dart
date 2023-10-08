import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/offline_record_controller.dart';
import '../controller/offline_scan_controller.dart';
import '../controller/user_controller.dart';
import 'choose_shop_page.dart';
import 'offline_sacn_page.dart';

class OfflineRecordPage extends GetView<OfflineRecordController> {
  const OfflineRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    OfflineScanController c = Get.find();
    UserController uc = Get.find();
    BrnEnhanceOperationDialog checkShopDialog = BrnEnhanceOperationDialog(
      context: context,
      iconType: BrnDialogConstants.iconAlert,
      titleText: "提示",
      descText: '使用该功能前必须先选择门店',
      mainButtonText: "选择门店",
      secondaryButtonText: "关闭",
      onMainButtonClick: () {
        Get.to(() => const ChooseShopPage());
      },
      onSecondaryButtonClick: () {},
    );
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('离线盘点记录'),
          ),
          body: ListView.builder(
              itemCount: controller.inventoryList.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text('离线单号：${controller.inventoryList[index].id!}'),
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
                                title: "确定删除该单据？",
                                cancel: '取消',
                                confirm: '确定', onConfirm: () async {
                              Navigator.pop(context);
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              if (await c.deleteOfflineInventory(
                                  controller.inventoryList[index].id ?? 0)) {
                                BrnToast.show("操作成功", context);
                                await controller.getOfflineInventoryList();
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
                              controller
                                  .restoreScan(controller.inventoryList[index]);
                              BrnLoadingDialog.dismiss(context);
                              Get.off(() => const PdaOfflineScanPage());
                            }, onCancel: () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        BrnSmallMainButton(
                          title: '同步',
                          width: 60,
                          onTap: () {
                            if (uc.shopId.value == 0) {
                              checkShopDialog.show();
                            } else {
                              BrnDialogManager.showConfirmDialog(context,
                                  title: "确定同步到博洋云店吗？",
                                  cancel: '取消',
                                  confirm: '确定', onConfirm: () async {
                                Navigator.pop(context);
                                BrnLoadingDialog.show(context,
                                    barrierDismissible: false);
                                if (await uc.syncOnlineInventory(
                                    controller.inventoryList[index])) {
                                  await c.deleteOfflineInventory(
                                      controller.inventoryList[index].id ?? 0);
                                  await controller.getOfflineInventoryList();
                                  BrnToast.show("操作成功", context);
                                }
                                BrnLoadingDialog.dismiss(context);
                              }, onCancel: () {
                                Navigator.pop(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.search_outlined),
            onPressed: () {
              BrnDialogManager.showConfirmDialog(context,
                  title: "单据搜索",
                  cancel: '重置',
                  confirm: '搜索',
                  messageWidget: Column(
                    children: [
                      BrnIconButton(
                          name: '时间',
                          direction: Direction.left,
                          iconWidget: Icon(
                            Icons.schedule,
                          ),
                          onTap: () {
                            DateTime currentTime = DateTime.now();
                            String format = 'MM月-dd日';
                            String MIN_DATETIME =
                                '${currentTime.year}-01-01 00:00:00';
                            String MAX_DATETIME =
                                '${currentTime.year}-12-31 23:59:59';
                            BrnPickerTitleConfig pickerTitleConfig =
                                BrnPickerTitleConfig(titleContent: "选择时间范围");
                            BrnDateRangePicker.showDatePicker(
                              context,
                              isDismissible: false,
                              minDateTime: DateTime.parse(MIN_DATETIME),
                              maxDateTime: DateTime.parse(MAX_DATETIME),
                              pickerMode: BrnDateTimeRangePickerMode.date,
                              pickerTitleConfig: pickerTitleConfig,
                              dateFormat: format,
                              initialStartDateTime: DateTime(
                                  currentTime.year,
                                  currentTime.month,
                                  currentTime.day,
                                  0,
                                  00,
                                  00),
                              initialEndDateTime: DateTime(
                                  currentTime.year,
                                  currentTime.month,
                                  currentTime.day,
                                  0,
                                  00,
                                  00),
                              onConfirm: (startDateTime, endDateTime, startlist,
                                  endlist) {
                                controller.changeTime(
                                    startDateTime, endDateTime);
                              },
                            );
                          }),
                      BrnTextInputFormItem(
                        isEdit: false,
                        controller: controller.timeCtrl.value,
                        maxCharCount: 100,
                        hint: "",
                        onChanged: (newValue) {},
                      ),
                    ],
                  ), onConfirm: () async {
                Navigator.pop(context);
                await controller.filterInventory();
              }, onCancel: () async {
                Navigator.pop(context);
                await controller.resetForm();
              });
            },
          ),
        ));
  }
}
