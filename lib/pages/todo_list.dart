import 'package:beyond_pda/controller/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_responsive_dialog.dart';
import 'package:beyond_pda/components/add_todo_dialog.dart';
import 'package:beyond_pda/components/todo_item.dart';
import 'package:beyond_pda/controller/todo.dart';
import 'package:get/get.dart';

class TodoListPage extends GetView<TodoController> {
  TodoListPage({Key? key}) : super(key: key);

  final SettingsController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Obx(() => Text('当前版本：${c.version}'))],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showMaterialResponsiveDialog(
              title: "Add todo".tr,
              child: const AddTodoDialog(),
              context: context,
              hideButtons: true);
        },
      ),
    );
  }
}
