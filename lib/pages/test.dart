import 'package:beyond_pda/controller/settings.dart';
import 'package:flutter/material.dart';
import 'package:sm_scan/shangmi_scan_mixin.dart';
import 'package:get/get.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return _MyState();
  }
}

// 第一步：混入ShangmiScanMixin
class _MyState extends State<TestPage> with ShangmiScanMixin<TestPage> {
  String _code = '';
  final SettingsController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'.tr),
        ),
        body: Column(
          children: [
            Text('扫描到数据：$_code'),
            Text('当前版本：${c.version}'),
          ],
        ));
  }

  /// 第二步：实现shangmiCodeHandle方法，当红外扫码头扫到数据执行的方法
  ///
  /// code: 表示扫码到的数据
  ///
  @override
  Future<void> shangmiCodeHandle(String code) async {
    /// 编写你的逻辑
    print('扫描到数据：$code');
    setState(() {
      _code = code;
    });
  }
}
