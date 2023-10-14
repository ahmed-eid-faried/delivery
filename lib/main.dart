import 'package:delivery/binding/bindings.dart';
import 'package:delivery/core/constant/apptheme.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/localization/locale.dart';
import 'package:delivery/core/localization/translation.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await initService();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Translation(),
          locale: controller.lang,
          title: 'E-commrce',
          theme: AppThemes.stdTheme,
          initialRoute: AppRoute.lang,
          // initialRoute: '/test',
          getPages: routes,
          initialBinding: MyBindings(),
        );
      },
    );
  }
}
