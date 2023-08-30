import 'package:beyond_pda/controller/online_scan_controller.dart';
import 'package:beyond_pda/controller/prod_query_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineScanPage extends GetView<OnlineScanController> {
  const OnlineScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProdQueryController());
    return Scaffold(
      body: Center(child: Text('在线扫码')),
    );
  }
}
