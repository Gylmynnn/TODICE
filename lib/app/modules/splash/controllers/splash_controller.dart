import 'package:get/get.dart';
import 'package:todice/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashC();
    super.onInit();
  }

  Future<void> splashC() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed(Routes.HOME);
  }
}
