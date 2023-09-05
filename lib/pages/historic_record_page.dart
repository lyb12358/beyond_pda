import 'package:beyond_pda/controller/historic_record_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoricRecordPage extends GetView<HistoricRecordController> {
  const HistoricRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('历史盘点'),
          ),
          body: ListView.builder(
              itemCount: controller.inventoryList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '盘点单号：${controller.inventoryList[index].documentCode!}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                              '盘点时间：${controller.inventoryList[index].checkTime ?? ''}'),
                          Text(
                              '状态：${controller.inventoryList[index].status ?? 0}'),
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
