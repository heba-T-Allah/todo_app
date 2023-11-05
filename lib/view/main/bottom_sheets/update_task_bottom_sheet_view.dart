import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/resources/strings_manager.dart';

import '../../../model/task-model.dart';
import '../../../resources/values_manager.dart';
import '../../../view_model/app_view_model.dart';

class UpdateTaskBottomSheet extends StatefulWidget {
  int taskIndex;
  AppViewModel appViewModel;

  UpdateTaskBottomSheet(
      {required this.taskIndex, required this.appViewModel, super.key});

  @override
  State<UpdateTaskBottomSheet> createState() => _UpdateTaskBottomSheetState(
      taskIndex: taskIndex, appViewModel: appViewModel);
}

class _UpdateTaskBottomSheetState extends State<UpdateTaskBottomSheet> {
  final TextEditingController taskEntryController = TextEditingController();
  int taskIndex;
  AppViewModel appViewModel;

  _UpdateTaskBottomSheetState(
      {required this.taskIndex, required this.appViewModel});

  void _onStart(AppViewModel appViewModel) {
    String taskTitle = appViewModel.getTaskTitle(taskIndex);
    taskEntryController.text = taskTitle;
  }

  @override
  void initState() {
    _onStart(appViewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Padding(
          padding:
              EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: AppSize.s12),
          child: Column(
            children: [
            Text(
            AppStrings.updateTask,
            style: Theme.of(context).textTheme.titleMedium,
          ),

              Padding(
                padding: const EdgeInsets.only(top: AppSize.s20),
                child: Center(
                  child: SizedBox(
                    height: 40,
                    width: 300,
                    child: TextField(
                      autofocus: true,
                      autocorrect: false,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: ColorManager.hintBlack,
                      controller: taskEntryController,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 3,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only( bottom: 10, left: 10, right: 10, top: 4),
                          fillColor: ColorManager.backgroundColor,
                          filled: true,
                          hintText: AppStrings.taskHintText,
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 2,
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
                        appViewModel.updateTaskTitle(
                            taskIndex, taskEntryController.text);
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


