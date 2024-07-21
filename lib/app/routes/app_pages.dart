// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:to_dice/app/modules/home/bindings/home_binding.dart';
import 'package:to_dice/app/modules/home/views/home_view.dart';
import 'package:to_dice/app/modules/settings/bindings/settings_binding.dart';
import 'package:to_dice/app/modules/settings/views/fragment/font_view.dart';
import 'package:to_dice/app/modules/settings/views/fragment/language_view.dart';
import 'package:to_dice/app/modules/settings/views/settings_view.dart';
import 'package:to_dice/app/modules/splash/bindings/splash_binding.dart';
import 'package:to_dice/app/modules/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.FLANGUAGE,
      page: () => const FLanguageView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.FFONT,
      page: () => const FFontView(),
      binding: SettingBinding(),
    ),
  ];
}
