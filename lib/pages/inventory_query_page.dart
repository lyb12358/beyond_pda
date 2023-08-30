import 'package:beyond_pda/controller/inventory_query_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryQueryPage extends GetView<InventoryQueryController> {
  const InventoryQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InventoryQueryController());
    return Scaffold(
      body: Center(child: Text('库存查询')),
    );
  }
}
