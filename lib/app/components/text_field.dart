import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_dice/app/utils/theme/controller.dart';

class MyTextField extends GetView<ThemeController> {
  const MyTextField({
    super.key,
    this.fieldController,
    required this.hintText,
    this.suffixIcon,
  });

  final TextEditingController? fieldController;
  final String hintText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: fieldController,
          style: TextStyle(
              color: controller.isDarkMode.value ? Colors.white : Colors.black),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            filled: true,
            fillColor: controller.isDarkMode.value
                ? Colors.grey.shade900
                : Colors.grey.shade300,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
          ),
        ));
  }
}
