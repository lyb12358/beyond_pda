import 'package:beyond_pda/pages/Test.dart';
import 'package:beyond_pda/pages/pda_login.dart';
import 'package:beyond_pda/pages/pda_offline_sacn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
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
            Get.to(() => const PdaLoginPage());
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
