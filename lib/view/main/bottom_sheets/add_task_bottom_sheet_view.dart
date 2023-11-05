import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/resources/strings_manager.dart';

import '../../../model/task-model.dart';
import '../../../resources/values_manager.dart';
import '../../../view_model/app_view_model.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({super.key});

  final TextEditingController taskEntryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: AppSize.s12),
          child: Column(
            children: [
              Text(
                AppStrings.addNewTodo,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.s20),
                child: Center(
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: TextField(
                      onSubmitted: (value) {
                        if (taskEntryController.text.isNotEmpty) {
                          appViewModel
                              .addTask(Task(taskEntryController.text, false));
                          print("task Added ${taskEntryController.text}");
                          taskEntryController.clear();
                        }
                        Navigator.of(context).pop();
                      },
                      autofocus: true,
                      autocorrect: false,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: ColorManager.hintBlack,
                      controller: taskEntryController,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              bottom: 10, left: 10, right: 10, top: 4),
                          fillColor: ColorManager.backgroundColor,
                          filled: true,
                          hintText: AppStrings.taskHintText,
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                  color: ColorManager.primary))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s50))),
                    onPressed: () {
                      taskEntryController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text(AppStrings.cancel),
                  ),
                  SizedBox(
                    width: AppSize.s20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s50))),
                    onPressed: () {
                      if (taskEntryController.text.isNotEmpty) {
                        appViewModel
                            .addTask(Task(taskEntryController.text, false));
                        print("task Added ${taskEntryController.text}");
                        taskEntryController.clear();
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(AppStrings.save),
                  ),
                  SizedBox(
                    width: AppSize.s50,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
