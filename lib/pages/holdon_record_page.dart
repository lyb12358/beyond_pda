import 'package:beyond_pda/controller/holdon_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoldonRecordPage extends GetView<HoldonRecordController> {
  const HoldonRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('盘点挂单'),
          ),
          body: ListView.builder(
              itemCount: controller.inventoryList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('挂单号：${controller.inventoryList[index].id!}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                              '创建时间：${controller.inventoryList[index].createTime ?? ''}'),
                          Text(
                              '盘点时间：${controller.inventoryList[index].checkTime ?? ''}'),
                          Text('状态：挂单'),
                        ],
                      ),
                    ],
                  ),
                  // leading: Image.network(
                  //   c.calImageUrl(c.codeList[index]),
                  //   headers: headersMap,
                  //   fit: BoxFit.cover,
                  // ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 22,
                    color: Colors.grey,
                  ),
                );
              }),
        ));
  }
}
