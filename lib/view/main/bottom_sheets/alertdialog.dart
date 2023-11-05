import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/strings_manager.dart';

import '../../../view_model/app_view_model.dart';

class AlertshowDialog extends StatelessWidget {
  final TextEditingController entryController = TextEditingController();
  int taskIndex;
  AppViewModel appViewModel;

  AlertshowDialog(
      {required this.taskIndex, required this.appViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return AlertDialog(
        title: Text(
          AppStrings.deleteTodo,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                AppStrings.areYouSure,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              //
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              AppStrings.cancel,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              AppStrings.ok,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            onPressed: () {
              appViewModel.deleteTask(taskIndex);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
