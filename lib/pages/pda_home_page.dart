import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/Test.dart';
import 'package:beyond_pda/pages/pda_login_page.dart';
import 'package:beyond_pda/pages/pda_offline_sacn_page.dart';
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
          child: const Column(
            children: [
              Icon(
                Icons.wifi_outlined,
                size: 80,
                color: Colors.lightBlue,
              ),
              Text(
                "在线盘点",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 15,
                ),
              )
            ],
          ),
          onPressed: () {
            GetStorage box = GetStorage();
            String xx = box.read('account');
            String yy = box.read('pwd');
            if (xx.isNotEmpty) {
              c.login(xx, yy);
            } else {
              Get.to(() => const PdaLoginPage());
            }
          },
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          child: const Column(
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
                  fontSize: 15,
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
