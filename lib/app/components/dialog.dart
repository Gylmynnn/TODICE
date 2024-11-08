import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todice/app/components/text_field.dart';
import 'package:todice/app/modules/home/controllers/home_controller.dart';
import 'package:todice/app/utils/theme/controller.dart';
import 'button.dart';

class DialogBox extends GetView<ThemeController> {
  final TextEditingController taskcontroller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const DialogBox({
    super.key,
    required this.taskcontroller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final homeC = Get.find<HomeController>();
    return Obx(() => Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? Colors.grey.shade900
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 10, right: 16, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('add-task'.tr,
                              style: TextStyle(
                                fontSize: 20,
                                color: controller.isDarkMode.value
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade900,
                              )),
                          IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: onCancel,
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      endIndent: 24,
                      indent: 24,
                    ),
                    Expanded(
                        child: Obx(() => ListView.builder(
                            itemCount: homeC.toDoSugesstion.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() => Column(
                                    children: [
                                      ListTile(
                                          contentPadding: const EdgeInsets.only(
                                            left: 24,
                                          ),
                                          title:
                                              Text(homeC.toDoSugesstion[index]),
                                          onTap: () =>
                                              homeC.accSugesstion(index)),
                                      // const Divider(
                                      //   endIndent: 24,
                                      //   indent: 24,
                                      // ),
                                    ],
                                  ));
                            })))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                      child: MyTextField(
                          hintText: 'Enter Task',
                          fieldController: taskcontroller)),
                  const Gap(6),
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: MyButton(
                      useIcon: true,
                      icon: const Icon(
                        Icons.add,
                      ),
                      onPressed: onSave,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
