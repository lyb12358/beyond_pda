import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:get/get.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';

import '../controller/offline_record_controller.dart';
import 'offline_record_page.dart';

class PdaOfflineScanPage extends StatefulWidget {
  const PdaOfflineScanPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return _MyState();
  }
}

class _MyState extends State<PdaOfflineScanPage>
    with ShangmiScanMixin<PdaOfflineScanPage> {
  final OfflineScanController c = Get.find();
  OfflineRecordController c1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => (c.codeList).isEmpty
        ? Scaffold(
            persistentFooterButtons: [
              BrnBottomButtonPanel(
                  mainButtonName: '保存',
                  mainButtonOnTap: () {
                    c.remarkInputController.text =
                        c.inventory.value.remark ?? '';
                    BrnMiddleInputDialog(
                        title: '确定要保存本次离线盘点吗',
                        message: '保存的盘点可在离线盘点记录中继续操作',
                        hintText: '备注',
                        cancelText: '取消',
                        confirmText: '确定',
                        maxLength: 100,
                        maxLines: 2,
                        barrierDismissible: false,
                        inputEditingController: c.remarkInputController,
                        textInputAction: TextInputAction.done,
                        onConfirm: (value) async {
                          if (await c.putOfflineInventory(value)) {
                            Navigator.pop(context);
                            c.resetOfflineScan();
                            await c1.getOfflineInventoryList();
                            BrnToast.show("保存成功", context);
                            Get.off(() => const OfflineRecordPage());
                          }
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        }).show(context);
                  },
                  enableMainButton: c.codeList.isNotEmpty,
                  secondaryButtonName: '离线记录',
                  secondaryButtonOnTap: () async {
                    await c1.getOfflineInventoryList();
                    Get.to(() => const OfflineRecordPage());
                  },
                  iconButtonList: [
                    //构造Icon按钮
                    BrnVerticalIconButton(
                        name: '重置',
                        iconWidget: Icon(
                          Icons.restart_alt,
                        ),
                        onTap: () {
                          BrnDialogManager.showConfirmDialog(context,
                              title: "确定重置盘点吗？",
                              cancel: '取消',
                              confirm: '确定', onConfirm: () async {
                            Navigator.pop(context);
                            c.resetOfflineScan();
                          }, onCancel: () {
                            Navigator.pop(context);
                          });
                        })
                  ])
            ],
            appBar: AppBar(
              title: const Text('离线盘点'),
            ),
            body: Center(
                child: BrnAbnormalStateWidget(
              img: Image.asset(
                'assets/images/no_data.png',
                scale: 3.0,
              ),
              content: '请扫码盘点',
            )),
          )
        : Scaffold(
            persistentFooterButtons: [
              BrnBottomButtonPanel(
                  mainButtonName: '保存',
                  mainButtonOnTap: () {
                    c.remarkInputController.text =
                        c.inventory.value.remark ?? '';
                    BrnMiddleInputDialog(
                        title: '确定保存本次离线盘点吗',
                        message:
                            '盘点个数${c.codeList.length}，盘点数量${c.calTotalNum()}',
                        hintText: '备注',
                        cancelText: '取消',
                        confirmText: '确定',
                        maxLength: 100,
                        maxLines: 2,
                        barrierDismissible: false,
                        inputEditingController: c.remarkInputController,
                        textInputAction: TextInputAction.done,
                        onConfirm: (value) async {
                          if (await c.putOfflineInventory(value)) {
                            Navigator.pop(context);
                            c.resetOfflineScan();
                            await c1.getOfflineInventoryList();
                            BrnToast.show("保存成功", context);
                            Get.off(() => const OfflineRecordPage());
                          }
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        }).show(context);
                  },
                  enableMainButton: c.codeList.isNotEmpty,
                  secondaryButtonName: '离线记录',
                  secondaryButtonOnTap: () async {
                    await c1.getOfflineInventoryList();
                    Get.to(() => const OfflineRecordPage());
                  },
                  iconButtonList: [
                    //构造Icon按钮
                    BrnVerticalIconButton(
                        name: '重置',
                        iconWidget: Icon(
                          Icons.restart_alt,
                        ),
                        onTap: () {
                          BrnDialogManager.showConfirmDialog(context,
                              title: "确定重置盘点吗？",
                              cancel: '取消',
                              confirm: '确定', onConfirm: () async {
                            Navigator.pop(context);
                            c.resetOfflineScan();
                          }, onCancel: () {
                            Navigator.pop(context);
                          });
                        })
                  ])
            ],
            appBar: AppBar(
              title: const Text('离线盘点'),
            ),
            // floatingActionButton: FloatingActionButton(
            //   child: const Icon(Icons.add),
            //   onPressed: () {
            //     print('乱点');
            //   },
            // ),
            body: ListView.builder(
                itemCount: c.codeList.length,
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: c.codeList[index].visible ?? true,
                    child: ListTile(
                      title: Text(c.codeList[index].prodName!),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text('编号：${c.codeList[index].prodCode!}'),
                              Text('盘点数量：${c.codeList[index].num!}'),
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
                        c.countInputController.text =
                            c.codeList[index].num!.toString();
                        BrnDialogManager.showSingleButtonDialog(
                          context,
                          title: "数量修改",
                          label: '确认',
                          messageWidget: Column(
                            children: [
                              BrnStepInputFormItem(
                                title: "数量",
                                canManualInput: true,
                                isEdit: true,
                                controller: c.countInputController,
                                maxLimit: 9999,
                                onChanged: (oldValue, newValue) {
                                  c.setCode(
                                      c.codeList[index].prodCode!, newValue);
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
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
                          controller: c.searchCtrl.value,
                          title: "编号/名称",
                          hint: "请输入",
                          maxCharCount: 50,
                          onChanged: (newValue) {},
                        ),
                      ],
                    ), onConfirm: () async {
                  Navigator.pop(context);
                  await c.filterList();
                }, onCancel: () async {
                  Navigator.pop(context);
                  await c.resetSearch();
                });
              },
            ),
          ));
  }

  @override
  Future<void> shangmiCodeHandle(String code) async {
    /// 编写你的逻辑
    c.addCode(code);
  }
}
