import 'package:beyond_pda/controller/prod_query_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdQueryPage extends GetView<ProdQueryController> {
  const ProdQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProdQueryController());
    return Scaffold(
      body: Center(child: Text('产品查询')),
    );
  }
}
