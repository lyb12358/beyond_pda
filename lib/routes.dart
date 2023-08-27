import 'package:beyond_pda/pages/pda_home.dart';
import 'package:beyond_pda/pages/settings.dart';
import 'package:beyond_pda/pages/test.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/setting', page: () => SettingPage()),
  GetPage(name: '/test', page: () => TestPage())
];
