import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/historic_record_page.dart';
import 'package:beyond_pda/pages/holdon_record_page.dart';
import 'package:beyond_pda/pages/record_detail_page.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';

import '../controller/historic_record_controller.dart';
import '../controller/holdon_record_controller.dart';

class OnlineScanPage extends StatefulWidget {
  const OnlineScanPage({super.key});
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return _MyState();
  }
}

// 第一步：混入ShangmiScanMixin
class _MyState extends State<OnlineScanPage>
    with ShangmiScanMixin<OnlineScanPage> {
  UserController c = Get.find();
  HoldonRecordController c1 = Get.find();
  HistoricRecordController c2 = Get.find();
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };
    //赋予输入框初始值
    //c.manualInputController.value.text = (c.currentProd.value.num).toString();
    return Obx(() => (c.currentProd.value.prodCode ?? '').isEmpty
        ? Scaffold(
            appBar: AppBar(
              title: const Text('在线扫码'),
            ),
            body: Center(
                child: BrnAbnormalStateWidget(
              img: Image.asset(
                'assets/images/no_data.png',
                scale: 3.0,
              ),
              content: '请扫码获取商品信息',
            )),
          )
        : Scaffold(
            persistentFooterButtons: [
              BrnBottomButtonPanel(
                  mainButtonName: '结束',
                  mainButtonOnTap: () {
                    BrnMiddleInputDialog(
                        title: '确定要结束本次盘点吗',
                        message: '结束的盘点将同步至博店助手PC端，也可在历史盘点菜单中继续操作',
                        hintText: '备注',
                        cancelText: '取消',
                        confirmText: '确定',
                        maxLength: 1000,
                        maxLines: 2,
                        barrierDismissible: false,
                        textInputAction: TextInputAction.done,
                        onConfirm: (value) async {
                          if (await c.addOnlineInventory(value)) {
                            Navigator.pop(context);
                            c.resetOnlineScan();
                            await c2.getOnlineInventoryList();
                            BrnToast.show("录入成功", context);
                            Get.off(() => const HistoricRecordPage());
                          }
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        }).show(context);
                  },
                  secondaryButtonName: '挂起',
                  secondaryButtonOnTap: () {
                    BrnMiddleInputDialog(
                        title: '确定要挂起本次盘点吗',
                        message: '挂起的盘点可在盘点挂单菜单中继续操作',
                        hintText: '备注',
                        cancelText: '取消',
                        confirmText: '确定',
                        maxLength: 1000,
                        maxLines: 2,
                        barrierDismissible: false,
                        textInputAction: TextInputAction.done,
                        onConfirm: (value) async {
                          if (await c.putHoldonInventory(value)) {
                            Navigator.pop(context);
                            c.resetOnlineScan();
                            await c1.getHoldonInventoryList();
                            BrnToast.show("挂起成功", context);
                            Get.off(() => const HoldonRecordPage());
                          }
                        },
                        onCancel: () {
                          Navigator.pop(context);
                        }).show(context);
                  },
                  iconButtonList: [
                    //构造Icon按钮
                    BrnVerticalIconButton(
                        name: '记录',
                        iconWidget: Icon(
                          Icons.list,
                        ),
                        onTap: () {
                          Get.to(() => RecordDetailPage());
                        })
                  ])
            ],
            appBar: AppBar(
              title: const Text('在线扫码'),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      c.calImageUrl(c.currentProd.value),
                      headers: headersMap,
                      scale: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BrnPairInfoTable(
                      isValueAlign: true,
                      rowDistance: 8,
                      itemSpacing: 30,
                      children: [
                        BrnInfoModal(
                          keyPart: Text('产品编号:',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          valuePart: Text(c.currentProd.value.prodCode ?? '',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        BrnInfoModal(
                          keyPart: Text('产品名称:',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          valuePart: Text(c.currentProd.value.prodName ?? '',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        BrnInfoModal(
                          keyPart: Text('规格:',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          valuePart: Text(c.currentProd.value.speName ?? '',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        BrnInfoModal(
                          keyPart: Text('盘点数量:',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          valuePart: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: BrnStepInputFormItem(
                              canManualInput: true,
                              isEdit: true,
                              controller: c.manualInputController.value,
                              maxLimit: 9999,
                              onChanged: (oldValue, newValue) {
                                debugPrint(newValue.toString());
                                c.setInventory(newValue);
                              },
                            ),
                          ),
                        ),
                        BrnInfoModal(
                          keyPart: Text('系统库存:',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          valuePart:
                              Text((c.currentProd.value.onlineNum).toString()),
                        ),
                        BrnInfoModal(
                            keyPart: Text('差异:',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            valuePart:
                                Text(c.currentProd.value.diffNum.toString())),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
  }

  @override
  Future<void> shangmiCodeHandle(String code) async {
    /// 编写你的逻辑
    var x = DateTime.now();
    await c.addCode(code);
    var y = DateTime.now();
    var diff = y.difference(x);
    debugPrint('执行时间${diff.inMilliseconds.toString()}毫秒');
  }
}
