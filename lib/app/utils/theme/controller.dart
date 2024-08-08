import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:to_dice/app/data/event/hive.dart';
import 'package:to_dice/app/utils/notification/notification.dart';
import 'package:to_dice/app/utils/theme/theme.dart';

class ThemeController extends GetxController {
  //observable variables
  RxBool isDarkMode = false.obs;
  RxBool isConfirm = false.obs;
  RxString selectedFont = ''.obs;
  RxString selectedLanguage = ''.obs;
  RxString selectedTransition = ''.obs;
  RxString appVerison = ''.obs;
  RxString appBuildNumber = ''.obs;

  //Hive box key value Variables
  String fontKey = 'selectedFont';
  String langkey = 'selectedLanguage';
  String transKey = 'selectedTransition';
  String themeKey = 'isDarkMode';

  @override
  void onInit() {
    super.onInit();
    initTransitionValue();
    initLangValue();
    updateLocale();
    initThemeModeValue();
    initFontValue();
    getAppVersion();
    switchTheme();
    NotificationUtils.initializeNotifications();
  }

  bool initThemeModeValue() {
    return isDarkMode.value =
        HiveLStorage.loadBox(themeKey, defaultValue: false);
  }

  String initFontValue() {
    return selectedFont.value =
        HiveLStorage.loadBox(fontKey, defaultValue: 'Lato');
  }

  String initTransitionValue() {
    return selectedTransition.value =
        HiveLStorage.loadBox(transKey, defaultValue: 'LTR');
  }

  String initLangValue() {
    return selectedLanguage.value =
        HiveLStorage.loadBox(langkey, defaultValue: 'en_US');
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVerison.value = packageInfo.version;
    appBuildNumber.value = packageInfo.buildNumber;
  }

  Future<void> updateLocale() async {
    Get.updateLocale(Locale(selectedLanguage.value.split('_')[0],
        selectedLanguage.value.split('_')[1]));
  }

  void switchTheme() {
    return Get.changeThemeMode(
        isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
    Get.updateLocale(
        Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    HiveLStorage.updateBox(themeKey, isDarkMode.value);
    switchTheme();
  }

  void changeFont(String font) => selectedFont.value = font;

  void changeTrasition(String trans) => selectedTransition.value = trans;

  void saveTransition() =>
      HiveLStorage.updateBox(transKey, selectedTransition.value);

  void saveFont() => HiveLStorage.updateBox(fontKey, selectedFont.value);

  void saveLanguage() =>
      HiveLStorage.updateBox(langkey, selectedLanguage.value);

  Transition getTransitionTheme() =>
      ThemeUtils.getDefaultTransition(selectedTransition.value);

  ThemeData getLightTheme() => ThemeUtils.getLightTheme(selectedFont.value);

  ThemeData getDarkTheme() => ThemeUtils.getDarkTheme(selectedFont.value);
}
