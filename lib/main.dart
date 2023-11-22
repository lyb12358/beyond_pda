import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:beyond_pda/repository/product_repository.dart';
import 'package:bruno/bruno.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/i18n/translations.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:beyond_pda/routes.dart';
import 'package:beyond_pda/pages/unknown.dart';
import 'package:beyond_pda/service/http_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/offline_record_controller.dart';
import 'controller/record_detail_controller.dart';

//import 'package:bot_toast/bot_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  // await Get.putAsync<HttpService>(() async => await HttpService()
  //     .init(baseUrl: "https://map.beyond-itcenter.com/usercenter"));
  await Get.putAsync<HttpService>(() async => await HttpService()
      .init(baseUrl: "https://shop.beyond-itservice.com/usercenter"));
  await Get.putAsync<ProductRepository>(
      () async => await ProductRepository().init());
  Get.put(UserRepository().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(RecordDetailController());
    Get.put(OfflineScanController());
    Get.put(OfflineRecordController());
    //final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      // 新增
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        BrnLocalizationDelegate.delegate,
      ],
      // 新增
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      initialRoute: '/',
      getPages: routes,
      unknownRoute:
          GetPage(name: '/not_found', page: () => const UnknownRoutePage()),
      theme: FlexThemeData.light(
        scheme: FlexScheme.materialBaseline,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.materialBaseline,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
      locale: const Locale('zh'),
      translations: MyTranslations(),
      builder: EasyLoading.init(),
      // builder: (BuildContext context, Widget? child) {
      //   // 1.调用BotToastInit
      //   child = botToastBuilder(context, child);
      //   EasyLoading.init();
      //   return child;
      // },
      //2. registered route observer
      //navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
    );
  }
}
