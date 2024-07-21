import 'package:get/get.dart';
import 'package:to_dice/app/modules/settings/controllers/settings_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
