import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/choose_shop_page.dart';
import 'package:beyond_pda/pages/historic_record_page.dart';
import 'package:beyond_pda/pages/holdon_record_page.dart';
import 'package:beyond_pda/pages/online_scan_page.dart';
import 'package:beyond_pda/pages/user_deatail_page.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'offline_sacn_page.dart';

class OnlineGridviewPage extends StatelessWidget {
  const OnlineGridviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    BrnEnhanceOperationDialog checkShopDialog = BrnEnhanceOperationDialog(
      context: context,
      iconType: BrnDialogConstants.iconAlert,
      titleText: "提示",
      descText: '使用该功能前必须先选择门店',
      mainButtonText: "选择门店",
      secondaryButtonText: "关闭",
      onMainButtonClick: () {
        Get.to(() => const ChooseShopPage());
      },
      onSecondaryButtonClick: () {},
    );
    BrnEnhanceOperationDialog checkProdDataDialog = BrnEnhanceOperationDialog(
      context: context,
      iconType: BrnDialogConstants.iconAlert,
      titleText: "提示",
      descText: '请下载商品资料以获得最佳体验',
      mainButtonText: "前往下载",
      secondaryButtonText: "关闭",
      onMainButtonClick: () async {
        BrnLoadingDialog.show(context, barrierDismissible: false);
        await c.updatePdaData();
        BrnLoadingDialog.dismiss(context);
      },
      onSecondaryButtonClick: () {},
    );
    return Scaffold(
      body: Center(
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.only(left: 40, top: 150, right: 40),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.barcode_reader,
                    size: 50,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "扫码",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () async {
                if (c.shopId.value == 0) {
                  checkShopDialog.show();
                } else if (c.updateTime.isEmpty) {
                  checkProdDataDialog.show();
                } else {
                  BrnLoadingDialog.show(context, barrierDismissible: false);
                  await c.getOnlineInventory();
                  Get.to(() => const OnlineScanPage());
                  BrnLoadingDialog.dismiss(context);
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 50,
                    color: Colors.purple,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "盘点挂单",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {
                if (c.shopId.value == 0) {
                  checkShopDialog.show();
                } else {
                  Get.to(() => const HoldonRecordPage());
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.work_history,
                    size: 50,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "历史盘点",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {
                if (c.shopId.value == 0) {
                  checkShopDialog.show();
                } else {
                  Get.to(() => const HistoricRecordPage());
                }
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 50,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "离线盘点",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              onPressed: () {
                Get.to(() => const PdaOfflineScanPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
