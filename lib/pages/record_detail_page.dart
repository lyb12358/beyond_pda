import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/record_detail_controller.dart';

class RecordDetailPage extends GetView<RecordDetailController> {
  const RecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecordDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('记录'),
      ),
      body: Center(child: Text('记录')),
    );
  }
}
