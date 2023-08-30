import 'package:beyond_pda/pages/choose_shop_page.dart';
import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:beyond_pda/pages/pda_home_page.dart';
import 'package:beyond_pda/pages/pda_login_page.dart';
import 'package:beyond_pda/pages/pda_offline_sacn_page.dart';
import 'package:beyond_pda/pages/settings.dart';
import 'package:beyond_pda/pages/test.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/login', page: () => const PdaLoginPage()),
  GetPage(name: '/offlineScan', page: () => const PdaOfflineScanPage()),
  GetPage(name: '/onlineWorkshop', page: () => const OnlineWorkshopPage()),
  GetPage(name: '/shop', page: () => const ChooseShopPage()),
  GetPage(name: '/setting', page: () => SettingPage()),
  GetPage(name: '/test', page: () => TestPage())
];
