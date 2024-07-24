import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_dice/app/utils/theme/controller.dart';
import 'package:to_dice/app/utils/translations/translations.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(const ToDice());
}

class ToDice extends GetView<ThemeController> {
  const ToDice({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          defaultTransition: controller.getTransitionTheme(),
          theme: controller.getLightTheme(),
          darkTheme: controller.getDarkTheme(),
          themeMode: _theTheme(),
          debugShowCheckedModeBanner: false,
          title: "Dice Todo",
          translations: Messages(),
          locale: _theLocale(),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }

  ThemeMode _theTheme() {
    return controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  Locale _theLocale() {
    return Locale(controller.selectedLanguage.value.split('_')[0],
        controller.selectedLanguage.value.split('_')[1]);
  }
}
