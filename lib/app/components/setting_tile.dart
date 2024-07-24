import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:to_dice/app/utils/theme/controller.dart';

class SettingTile extends GetView<ThemeController> {
  const SettingTile({
    super.key,
    required this.leading,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final Icon leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      tileColor: controller.isDarkMode.value
          ? Colors.grey.shade900
          : Colors.grey.shade300,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_sharp),
      leading: leading,
    );
  }
}
