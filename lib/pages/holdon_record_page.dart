import 'package:beyond_pda/controller/holdon_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoldonRecordPage extends GetView<HoldonRecordController> {
  const HoldonRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HoldonRecordController());
    return Scaffold(
      body: Center(child: Text('盘点挂单')),
    );
  }
}
