import 'package:beyond_pda/pages/choose_shop_page.dart';
import 'package:beyond_pda/pages/historic_record_page.dart';
import 'package:beyond_pda/pages/holdon_record_page.dart';
import 'package:beyond_pda/pages/inventory_query_page.dart';
import 'package:beyond_pda/pages/online_gridview_page.dart';
import 'package:beyond_pda/pages/online_workshop_page.dart';
import 'package:beyond_pda/pages/home_page.dart';
import 'package:beyond_pda/pages/login_page.dart';
import 'package:beyond_pda/pages/offline_sacn_page.dart';
import 'package:beyond_pda/pages/prod_query_page.dart';
import 'package:beyond_pda/pages/settings.dart';
import 'package:beyond_pda/pages/test.dart';
import 'package:beyond_pda/pages/user_deatail_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/login', page: () => const PdaLoginPage()),
  GetPage(name: '/offlineScan', page: () => const PdaOfflineScanPage()),
  GetPage(name: '/onlineWorkshop', page: () => const OnlineWorkshopPage()),
  GetPage(name: '/onlineGridview', page: () => const OnlineGridviewPage()),
  GetPage(name: '/holdonRecord', page: () => const HoldonRecordPage()),
  GetPage(name: '/historicRecord', page: () => const HistoricRecordPage()),
  GetPage(name: '/prodQuery', page: () => const ProdQueryPage()),
  GetPage(name: '/inventoryQuery', page: () => const InventoryQueryPage()),
  GetPage(name: '/userDetail', page: () => const UserDetailPage()),
  GetPage(name: '/shop', page: () => const ChooseShopPage()),
  GetPage(name: '/setting', page: () => SettingPage()),
  GetPage(name: '/test', page: () => TestPage())
];
