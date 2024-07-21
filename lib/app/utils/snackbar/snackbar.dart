import 'package:get/get.dart';

void cSnackBar(
  String title,
  String message, {
  SnackPosition? snackPosition,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: snackPosition,
  );
}
