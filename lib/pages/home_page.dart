import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/login_page.dart';
import 'package:beyond_pda/pages/offline_sacn_page.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi,
                size: 80,
                color: Colors.lightBlue,
              ),
              Text(
                "在线盘点",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 20,
                ),
              )
            ],
          ),
          onPressed: () async {
            BrnLoadingDialog.show(context, barrierDismissible: false);
            GetStorage box = GetStorage();
            String xx = box.read('account') ?? '';
            String yy = box.read('pwd') ?? '';
            if (xx.isNotEmpty) {
              await c.login(xx, yy);
            } else {
              Get.to(() => const PdaLoginPage());
            }
            BrnLoadingDialog.dismiss(context);
          },
        ),
        const SizedBox(height: 60),
        ElevatedButton(
          style: ButtonStyle(
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            shadowColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_outlined,
                size: 80,
                color: Colors.orange,
              ),
              Text(
                "离线盘点",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                ),
              )
            ],
          ),
          onPressed: () {
            Get.to(() => const PdaOfflineScanPage());
          },
        ),
      ],
    );
  }
}
