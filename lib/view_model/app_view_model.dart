import 'package:flutter/material.dart';

import '../model/task-model.dart';
import '../model/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("heba");

  int get numTasks => tasks.length;

  int get completedTasks => tasks.where((task) => task.complete).length;

  int get remainingTasks => tasks.where((task) => !task.complete).length;

  String get getUserName => user.userName;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void updateUserName(String newUserName) {
    user.userName = newUserName;
    notifyListeners();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void updateTaskTitle(int taskIndex, String newTitle) {
    tasks[taskIndex].title = newTitle;
    notifyListeners();
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      // isScrollControlled: true,
      builder: (context) {
        return bottomSheetView;
      },
    );
  }
}
