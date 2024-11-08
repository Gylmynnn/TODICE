import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todice/app/data/models/settings_model.dart';
import 'package:todice/app/routes/app_pages.dart';

class SettingController extends GetxController {
  RxList<String> fontsValue = [
    'Roboto',
    'Open Sans',
    'Lato',
    'Comic Neue',
    'Montserrat',
    'Nunito',
    'Raleway',
    'Poppins',
  ].obs;

  RxList<String> transitionsValue = [
    'LeftToRight',
    'RightToLeft',
    'FadeIn',
    'DownToUp',
    'UpToDown',
    'Zoom',
    'Fade',
  ].obs;

  RxList<List<String>> languagesValue = [
    ['English', 'en_US'],
    ['Indonesia', 'id_ID'],
  ].obs;

  RxList<SettingsModel> settingsMenuValue = <SettingsModel>[
    SettingsModel(
      leading: const Icon(Icons.font_download_outlined),
      title: 'Font',
      onTap: () => Get.toNamed(Routes.FFONT),
    ),
    SettingsModel(
        leading: const Icon(Icons.language_sharp),
        title: "language",
        onTap: () => Get.toNamed(Routes.FLANGUAGE)),
    SettingsModel(
        leading: const Icon(Icons.pages_rounded),
        title: "transition",
        onTap: () => Get.toNamed(Routes.TRANSITION)),
    SettingsModel(
        leading: const Icon(Icons.dark_mode),
        title: "Theme Mode",
        onTap: () => Get.toNamed(Routes.THEMEMODE)),
  ].obs;
}
