import 'package:beyond_pda/controller/historic_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoricRecordPage extends GetView<HistoricRecordController> {
  const HistoricRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricRecordController());
    return Scaffold(
      body: Center(child: Text('历史盘点')),
    );
  }
}
