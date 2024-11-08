import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todice/app/modules/settings/controllers/settings_controller.dart';
import 'package:todice/app/utils/snackbar/snackbar.dart';
import 'package:todice/app/utils/theme/controller.dart';

class FTransitionView extends GetView<SettingController> {
  const FTransitionView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              themeC.isConfirm.value
                  ? cSnackBar('notification'.tr,
                      '${'change_language'.tr} ${'successfully'.tr}',
                      snackPosition: SnackPosition.BOTTOM)
                  : null;
              themeC.isConfirm.value = false;
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text('change_language'.tr),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: themeC.isDarkMode.value
                  ? Colors.grey.shade900
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'hallo_world'.tr,
                style: TextStyle(
                  fontSize: 24,
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade300
                      : Colors.grey.shade900,
                ),
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: ListView.builder(
              itemCount: controller.transitionsValue.length,
              itemBuilder: (BuildContext context, int index) {
                final String transValue = controller.transitionsValue[index];
                return Obx(() => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      height: 80,
                      decoration: BoxDecoration(
                        color: themeC.isDarkMode.value
                            ? Colors.grey.shade900
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: transValue,
                            groupValue: themeC.selectedTransition.value,
                            onChanged: (String? value) {
                              if (value != null) {
                                themeC.changeTrasition(value);
                                themeC.isConfirm.value = true;
                                themeC.saveTransition();
                              }
                            },
                          ),
                          Text(transValue,
                              style: TextStyle(
                                  color: themeC.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18)),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
