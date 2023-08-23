import 'package:beyond_pda/pages/home.dart';
import 'package:beyond_pda/pages/settings.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/setting', page: () => SettingPage())
];
