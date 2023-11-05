import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/values_manager.dart';

import '../../view_model/app_view_model.dart';
import 'bottom_sheets/add_task_bottom_sheet_view.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s50))),
              onPressed: () {
                HapticFeedback.heavyImpact();
                appViewModel.bottomSheetBuilder(AddTaskBottomSheet(), context);
              },
              child: Icon(
                Icons.add,
                size: 30,
              )),
        );
      },
    );
  }
}
