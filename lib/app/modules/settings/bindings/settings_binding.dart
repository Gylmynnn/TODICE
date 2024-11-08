import 'package:get/get.dart';
import 'package:todice/app/modules/settings/controllers/settings_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
