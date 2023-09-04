import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/record_detail_page.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';

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
  final GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };
    //赋予输入框初始值
    //c.manualInputController.value.text = (c.currentProd.value.num).toString();
    return Obx(() => (c.singleProd.value.prodCode ?? '').isEmpty
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
                    BrnToast.show('主按钮被点击', context);
                  },
                  secondaryButtonName: '挂起',
                  secondaryButtonOnTap: () {
                    BrnToast.show('次按钮被点击', context);
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
                          valuePart: Text(c.currentProd.value.code ?? '',
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
