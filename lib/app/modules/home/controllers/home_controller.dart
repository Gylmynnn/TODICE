import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todice/app/data/event/hive.dart';
import 'package:todice/app/utils/notification/notification.dart';
import 'package:todice/app/utils/snackbar/snackbar.dart';

class HomeController extends GetxController {
  RxList<dynamic> toDoList = [].obs;
  RxList<dynamic> filteredToDoList = [].obs;
  RxList<String> toDoSugesstion =
      [_sugesstion1, _sugesstion2, _sugesstion3].obs;
  late TextEditingController taskController;
  late TextEditingController searchController;

  final String todoBoxKey = 'TODOLIST';
  static const String _sugesstion1 = 'Do Homework ?';
  static const String _sugesstion2 = 'Go To Campus ?';
  static const String _sugesstion3 = 'Go Healing ?';

  @override
  void onInit() {
    super.onInit();
    taskController = TextEditingController();
    searchController = TextEditingController();
    searchController.addListener(_filterTasks);
    if (HiveLStorage.loadBox(todoBoxKey) == null) {
      createInitialData();
    } else {
      loadData();
    }
  }

  @override
  void onClose() {
    taskController.dispose();
    searchController.dispose();
    super.onClose();
  }

  void createInitialData() {
    toDoList.value = [
      ["Progress Let's Go", false],
    ];
    filteredToDoList.value = toDoList;
    updateDataBase();
    NotificationUtils.showNotification();
  }

  void exitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }

  void loadData() {
    toDoList.value = HiveLStorage.loadBox(todoBoxKey);
    filteredToDoList.value = toDoList;
  }

  void accSugesstion(int index) {
    taskController.text = toDoSugesstion[index];
  }

  // update the database
  void updateDataBase() {
    HiveLStorage.updateBox(todoBoxKey, toDoList.toList());
  }

  void checkBoxChanged(int index) {
    int realIndex = _getReallIndex(index);
    toDoList[realIndex][1] = !toDoList[realIndex][1];
    updateDataBase();
    _filterTasks();
  }

  void saveNewTask() {
    if (taskController.text.isEmpty) {
      cSnackBar('notification'.tr, 'Task Cant Empty',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      toDoList.add([taskController.text, false]);
      updateDataBase();
      taskController.clear();
      Get.back();
      cSnackBar('notification'.tr, '${'successfully'.tr} , ${'task_added'.tr}',
          snackPosition: SnackPosition.TOP);
      _filterTasks();
    }
  }

  bool iconSearchText() {
    if (searchController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void _filterTasks() {
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredToDoList.value = toDoList;
    } else {
      filteredToDoList.value = toDoList.where((task) {
        return task[0].toLowerCase().contains(query);
      }).toList();
    }
  }

  int _getReallIndex(int filteredIndex) {
    final String taskName = filteredToDoList[filteredIndex][0];
    return toDoList.indexWhere((todo) => todo[0] == taskName);
  }

  void deleteTask(int index) {
    int realIndex = _getReallIndex(index);
    toDoList.removeAt(realIndex);
    updateDataBase();
    _filterTasks();
  }
}
