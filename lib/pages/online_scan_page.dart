import 'package:beyond_pda/controller/online_scan_controller.dart';
import 'package:beyond_pda/controller/prod_query_controller.dart';
import 'package:beyond_pda/controller/user_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnlineScanPage extends GetView<OnlineScanController> {
  const OnlineScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProdQueryController());
    UserController c = Get.find();
    final GetStorage box = GetStorage();
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('在线扫码'),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://ims-backend.beyond-itservice.com/image/style/16167/161671621331959265thumbnail.jpg',
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
                    valuePart: Text('94222153403',
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
                    valuePart: Text('如嫣',
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
                    valuePart: Text('1.8m',
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
                        value: 3,
                        maxLimit: 200,
                        onTip: () {
                          BrnToast.show("点击触发onTip回调", context);
                        },
                        onAddTap: () {
                          BrnToast.show("点击触发onAddTap回调", context);
                        },
                        onRemoveTap: () {
                          BrnToast.show("点击触发onRemoveTap回调", context);
                        },
                        onChanged: (oldValue, newValue) {
                          BrnToast.show(
                              "点击触发回调${oldValue}_${newValue}_onChanged",
                              context);
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
                    valuePart: '2',
                  ),
                  BrnInfoModal(
                    keyPart: Text('差异:',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    valuePart: c.onlineInventoryList.length.toString(),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
