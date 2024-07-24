import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:to_dice/app/components/setting_tile.dart';
import 'package:to_dice/app/data/models/settings_model.dart';
import 'package:to_dice/app/modules/settings/controllers/settings_controller.dart';
import 'package:to_dice/app/routes/app_pages.dart';
import 'package:to_dice/app/utils/theme/controller.dart';

class SettingsView extends GetView<SettingController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() => Column(
                children: RxList.generate(
              controller.settingsMenuValue.length,
              (index) {
                final SettingsModel setting =
                    controller.settingsMenuValue[index];
                return Column(
                  children: [
                    SettingTile(
                        leading: setting.leading,
                        onTap: setting.onTap,
                        title: setting.title.tr),
                    const Gap(14)
                  ],
                );
              },
            ))),
      ),
    );
  }
}
