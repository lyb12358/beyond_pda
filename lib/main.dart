import 'package:beyond_pda/controller/offline_scan_controller.dart';
import 'package:beyond_pda/repository/product_repository.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:beyond_pda/controller/user_controller.dart';
import 'package:beyond_pda/i18n/translations.dart';
import 'package:beyond_pda/repository/user_repository.dart';
import 'package:beyond_pda/routes.dart';
import 'package:beyond_pda/pages/unknown.dart';
import 'package:beyond_pda/service/http_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync<HttpService>(() async => await HttpService()
      .init(baseUrl: "https://map.beyond-itcenter.com/usercenter"));
  await Get.putAsync<ProductRepository>(
      () async => await ProductRepository().init());
  Get.put(UserRepository().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(OfflineScanController());
    return GetMaterialApp(
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
      debugShowCheckedModeBanner: false,
    );
  }
}
