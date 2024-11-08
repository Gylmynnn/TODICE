import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:todice/app/data/event/hive.dart';
import 'package:todice/app/utils/notification/notification.dart';
import 'package:todice/app/utils/theme/theme.dart';

class ThemeController extends GetxController {
  //observable variables
  final RxBool isDarkMode = false.obs;
  final RxBool isConfirm = false.obs;
  final RxString selectedFont = ''.obs;
  final RxString selectedLanguage = ''.obs;
  final RxString selectedTransition = ''.obs;
  final RxString appVerison = ''.obs;
  final RxString appBuildNumber = ''.obs;
  final RxString appName = ''.obs;

  //Hive box key value Variables
  final String fontKey = 'selectedFont';
  final langkey = 'selectedLanguage';
  final transKey = 'selectedTransition';
  final themeKey = 'isDarkMode';

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

  bool get getDarkMode => isDarkMode.value;
  String get getSelectedFont => selectedFont.value;
  String get getSelectedTrs => selectedTransition.value;
  String get getSelectedLang => selectedLanguage.value;
  set setDarkMode(bool value) => isDarkMode.value = value;
  set setSelectedFont(String value) => selectedFont.value = value;
  set setSelectedTrs(String value) => selectedTransition.value = value;
  set setSelectedLang(String value) => selectedLanguage.value = value;

  bool initThemeModeValue() {
    return setDarkMode = HiveLStorage.loadBox(themeKey, defaultValue: false);
  }

  String initFontValue() {
    return setSelectedFont =
        HiveLStorage.loadBox(fontKey, defaultValue: 'Lato');
  }

  String initTransitionValue() {
    return setSelectedTrs = HiveLStorage.loadBox(transKey, defaultValue: 'LTR');
  }

  String initLangValue() {
    return setSelectedLang =
        HiveLStorage.loadBox(langkey, defaultValue: 'en_US');
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVerison.value = packageInfo.version;
    appBuildNumber.value = packageInfo.buildNumber;
    appName.value = packageInfo.appName;
  }

  Future<void> updateLocale() async {
    Get.updateLocale(
        Locale(getSelectedLang.split('_')[0], getSelectedLang.split('_')[1]));
  }

  void switchTheme() {
    return Get.changeThemeMode(getDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void changeLanguage(String languageCode) {
    setSelectedLang = languageCode;
    Get.updateLocale(
        Locale(languageCode.split('_')[0], languageCode.split('_')[1]));
  }

  void toggleTheme() {
    setDarkMode = !getDarkMode;
    HiveLStorage.updateBox(themeKey, getDarkMode);
    switchTheme();
    isDarkMode.refresh();
  }

  void changeFont(String font) => setSelectedFont = font;

  void changeTrasition(String trans) => setSelectedTrs = trans;

  void saveTransition() => HiveLStorage.updateBox(transKey, getSelectedTrs);

  void saveFont() => HiveLStorage.updateBox(fontKey, getSelectedFont);

  void saveLanguage() => HiveLStorage.updateBox(langkey, getSelectedLang);

  Transition getTransitionTheme() =>
      ThemeUtils.getDefaultTransition(getSelectedTrs);

  ThemeData getLightTheme() => ThemeUtils.getLightTheme(getSelectedFont);

  ThemeData getDarkTheme() => ThemeUtils.getDarkTheme(getSelectedFont);
}
