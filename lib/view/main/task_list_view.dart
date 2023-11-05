import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/resources/values_manager.dart';
import 'package:todo_app/view/main/bottom_sheets/update_task_bottom_sheet_view.dart';

import '../../view_model/app_view_model.dart';
import 'bottom_sheets/alertdialog.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Container(
          decoration: BoxDecoration(
              color: ColorManager.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: appViewModel.numTasks,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  appViewModel.deleteTask(index);
                },
                background: Container(
                    margin: EdgeInsets.symmetric(horizontal:AppSize.s5),
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(AppSize.s10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red.shade700,
                      ),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s20),
                          bottomRight: Radius.circular(AppSize.s20)),

                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s4)),
                          // side: BorderSide(
                          //     width: 2, color: ColorManager.backgroundColor),
                          activeColor: ColorManager.backgroundColor,
                          checkColor: ColorManager.primary,
                          value: appViewModel.getTaskValue(index),
                          onChanged: (value) {
                            appViewModel.setTaskValue(index, value!);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "${appViewModel.getTaskTitle(index)}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlertshowDialog(
                                            taskIndex: index,
                                            appViewModel: appViewModel,
                                          )));
                            },
                            icon:
                                Icon(Icons.delete, color: ColorManager.primary)),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              appViewModel.bottomSheetBuilder(
                                  UpdateTaskBottomSheet(
                                      taskIndex: index,
                                      appViewModel: appViewModel),
                                  context);
                            },
                            icon: Icon(Icons.edit, color: ColorManager.primary)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
