import 'package:flutter/material.dart';
import 'package:beyond_pda/controller/todo.dart';
import 'package:beyond_pda/pages/settings.dart';
import 'package:beyond_pda/pages/Test.dart';
import 'package:beyond_pda/pages/todo_list.dart';
import 'package:get/get.dart';

class HomePageBak extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePageBak({Key? key});

  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'all') {
                controller.fetchToDos();
              } else if (value == 'completed') {
                controller.fetchToDos(completed: true);
              } else if (value == 'incomplete') {
                controller.fetchToDos(completed: false);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'all',
                child: Text('All'),
              ),
              const PopupMenuItem<String>(
                value: 'completed',
                child: Text('Completed'),
              ),
              const PopupMenuItem<String>(
                value: 'incomplete',
                child: Text('Incomplete'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 8,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'appTitle'.tr,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    //const GithubUserInfoWidget(),
                  ],
                ),
                Divider(
                  color: Theme.of(Get.context!).colorScheme.primary,
                  thickness: 0.5,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        title: Text('Home'.tr),
                        leading: const Icon(Icons.list),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text('Settings'.tr),
                        leading: const Icon(Icons.settings),
                        onTap: () {
                          Get.to(() => SettingPage());
                        },
                      ),
                      ListTile(
                        title: Text('Help'.tr),
                        leading: const Icon(Icons.help),
                        onTap: () {
                          Get.to(() => TestPage());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: const Text(
                    'App Version 1.1.0',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TodoListPage(),
    );
  }
}
