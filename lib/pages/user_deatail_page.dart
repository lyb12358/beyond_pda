import 'package:beyond_pda/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailPage extends GetView<UserController> {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('我的')),
    );
  }
}
