import 'package:beyond_pda/controller/user_controller.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:beyond_pda/animation/fade_animation.dart';
import 'package:get/get.dart';

import 'offline_sacn_page.dart';

class PdaLoginPage extends StatelessWidget {
  const PdaLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Beyond",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide())),
                                  child: TextField(
                                    onChanged: (text) {
                                      c.name.value = text;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "账号",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Obx(() => Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (text) {
                                          c.pwd.value = text;
                                        },
                                        obscureText: c.isObscure.value,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                icon: Icon(c.isObscure.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  c.isObscure.value =
                                                      !c.isObscure.value;
                                                }),
                                            border: InputBorder.none,
                                            hintText: "密码",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ))
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () async {
                              BrnLoadingDialog.show(context,
                                  barrierDismissible: false);
                              await c.login(c.name.value, c.pwd.value);
                              BrnLoadingDialog.dismiss(context);
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "登录",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                          1.5,
                          Text.rich(TextSpan(
                              text: "离线盘点?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const PdaOfflineScanPage());
                                }))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
