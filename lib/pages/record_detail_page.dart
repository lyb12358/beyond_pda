import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/record_detail_controller.dart';
import '../controller/user_controller.dart';

class RecordDetailPage extends GetView<RecordDetailController> {
  const RecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecordDetailController());
    UserController c = Get.find();
    final GetStorage box = GetStorage();
    Map<String, String> headersMap = {
      'Cookie': 'x-token=${box.read("x-token")}'
    };
    return Obx(() => Scaffold(
            persistentFooterButtons: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('盘点数量：${controller.totalNum.value}'),
                  Text('库存总数量：${controller.totalOnlineNum.value}'),
                  Text(
                      '差异：${controller.totalNum.value - controller.totalOnlineNum.value}'),
                ],
              ),
            ],
            appBar: AppBar(
              title: Text(controller.calPageName()),
            ),
            body: ListView.builder(
                itemCount: c.codeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(c.codeList[index].prodName!),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text('编号：${c.codeList[index].prodCode!}'),
                            Text('盘点数量：${c.codeList[index].num!}'),
                            Text('库存差异：${c.codeList[index].diffNum!}'),
                          ],
                        ),
                      ],
                    ),
                    leading: Image.network(
                      c.calImageUrl(c.codeList[index]),
                      headers: headersMap,
                      fit: BoxFit.cover,
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
                                c.setInventoryInDetail(
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
                  );
                })));
  }
}
