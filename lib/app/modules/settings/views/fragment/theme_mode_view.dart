import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todice/app/modules/settings/controllers/settings_controller.dart';
import 'package:todice/app/utils/theme/controller.dart';

class FThemeModeView extends GetView<SettingController> {
  const FThemeModeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
        appBar: AppBar(
          title: Text('change_theme_mode'.tr),
          centerTitle: true,
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Switch(
                    thumbColor: WidgetStatePropertyAll(
                      themeC.isDarkMode.value ? Colors.black : Colors.white,
                    ),
                    trackColor: WidgetStatePropertyAll(
                      themeC.isDarkMode.value ? Colors.white : Colors.black,
                    ),
                    thumbIcon: WidgetStatePropertyAll(
                      Icon(
                        themeC.isDarkMode.value
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                        fill: 1,
                        color: themeC.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    value: themeC.isDarkMode.value,
                    onChanged: (value) {
                      themeC.toggleTheme();
                    },
                  ),
                ),
                const Gap(46),
              ],
            ),
          ),
        ));
  }
}


  //   IconButton(
    //     icon: Obx(() =>
    //         Icon(themeC.isDarkMode.value ? Icons.dark_mode : Icons.light_mode)),
    //     onPressed: () {
    //       themeC.toggleTheme();
    //     },
    //   ),
