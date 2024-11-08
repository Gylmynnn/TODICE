// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:todice/app/modules/about/bindings/about_binding.dart';
import 'package:todice/app/modules/about/views/about_view.dart';
import 'package:todice/app/modules/home/bindings/home_binding.dart';
import 'package:todice/app/modules/home/views/home_view.dart';
import 'package:todice/app/modules/settings/bindings/settings_binding.dart';
import 'package:todice/app/modules/settings/views/fragment/font_view.dart';
import 'package:todice/app/modules/settings/views/fragment/language_view.dart';
import 'package:todice/app/modules/settings/views/fragment/theme_mode_view.dart';
import 'package:todice/app/modules/settings/views/fragment/transition_view.dart';
import 'package:todice/app/modules/settings/views/settings_view.dart';
import 'package:todice/app/modules/splash/bindings/splash_binding.dart';
import 'package:todice/app/modules/splash/views/splash_view.dart';
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
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
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
    GetPage(
      name: _Paths.FTANSITION,
      page: () => const FTransitionView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.FTHEMEMODE,
      page: () => const FThemeModeView(),
      binding: SettingBinding(),
    ),
  ];
}
