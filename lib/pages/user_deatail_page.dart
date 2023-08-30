import 'package:beyond_pda/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
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
                  Icons.message,
                ), //左图标
                title: Text('hahaha'), //中间标题
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.message,
                ), //左图标
                title: Text('hahaha'), //中间标题
                trailing: Icon(Icons.arrow_forward_ios),
              ),
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
