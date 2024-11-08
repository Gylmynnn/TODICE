import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todice/app/modules/about/controllers/about_controller.dart';
import 'package:todice/app/utils/theme/controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeC = Get.find<ThemeController>();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(themeC),
    );
  }
}

Widget _buildBody(ThemeController themeC) {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    children: [

      Stack(
        children: [
          Positioned(
            left: 50,
            right: 50,
            bottom: 50,
            child: Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(
                  color: themeC.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  shape: BoxShape.circle),
            ),
          ),
          Image.asset('assets/logo-img.png'),
        ],
      ),
    ],
  );
}

AppBar _buildAppBar() {
  return AppBar(
    title: Text("about".tr),
    centerTitle: true,
  );
}
