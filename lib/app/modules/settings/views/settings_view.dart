import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todice/app/components/setting_tile.dart';
import 'package:todice/app/data/models/settings_model.dart';
import 'package:todice/app/modules/settings/controllers/settings_controller.dart';
// import 'package:todice/app/utils/theme/controller.dart';

class SettingsView extends GetView<SettingController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        centerTitle: true,
        actions: const [],
      ),
      body: _buildBody(controller),
    );
  }
}

Padding _buildBody(SettingController controller) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Obx(
      () => Column(
        children: RxList.generate(
          controller.settingsMenuValue.length,
          (index) {
            final SettingsModel setting = controller.settingsMenuValue[index];
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
        ),
      ),
    ),
  );
}
