import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/pages/choose_shop_page.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    BrnEnhanceOperationDialog logoutDialog = BrnEnhanceOperationDialog(
      context: context,
      iconType: BrnDialogConstants.iconAlert,
      titleText: "提示",
      descText: "确认登出将清除数据并返回首页",
      mainButtonText: "确认",
      secondaryButtonText: "关闭",
      onMainButtonClick: () {
        c.logout();
      },
      onSecondaryButtonClick: () {},
    );
    BrnEnhanceOperationDialog downloadProdDialog = BrnEnhanceOperationDialog(
      context: context,
      iconType: BrnDialogConstants.iconAlert,
      titleText: "提示",
      descText: "是否要更新商品资料！",
      mainButtonText: "确认",
      secondaryButtonText: "关闭",
      onMainButtonClick: () async {
        BrnLoadingDialog.show(context, barrierDismissible: false);
        await c.updatePdaData();
        BrnLoadingDialog.dismiss(context);
      },
      onSecondaryButtonClick: () {},
    );
    return ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                color: Colors.lightBlue,
                height: 150.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/clock.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        //加间距
                        height: 10.0,
                      ),
                      Obx(() => Text(
                            c.name.value,
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(
                    Icons.store,
                  ), //左图标
                  title: Obx(() => Text(
                      '当前门店:${c.shopNo.value}-${c.shopName.value}')), //中间标题
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => {Get.to(() => const ChooseShopPage())}),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.king_bed,
                  ), //左图标
                  title: Obx(() => Text(
                      '更新商品资料${c.updateTime.value.isEmpty ? '  待下载' : ' 上次更新日期： ${c.updateTime.value}'}')), //中间标题
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => {downloadProdDialog.show()}),
              Divider(),
              ListTile(
                  leading: Icon(
                    Icons.logout,
                  ), //左图标
                  title: Text('退出登录'), //中间标题
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => {logoutDialog.show()}),
            ],
          );
        },
        separatorBuilder: (context, index) {
          //没作用
          return Divider();
        }, //分隔线
        itemCount: 1);
  }
}
