import 'package:flutter/material.dart';
import 'package:todo_app/view/main/task_list_view.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import 'add_task_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  AppViewModel viewModel = AppViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: IconButton(
          color: ColorManager.white,
          onPressed: () {
            Navigator.of(context).push(RouteGenerator.getRoutes(
                RouteSettings(name: Routes.dashBoardRoute)));
          },
          icon: Icon(Icons.menu),
        ),
        title: Container(
          margin: EdgeInsets.only(left: AppSize.s14),
          child: Row(
            children: [
              Text(
                AppStrings.welcome,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "${viewModel.getUserName}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(RouteGenerator.getRoutes(
                  RouteSettings(name: Routes.profileRoute)));
            },
            icon: Icon(
              Icons.person,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          //header view
          // Expanded(flex: 1, child: HeaderView()),

          //task list view
          Expanded(
            flex: 7,
            child: TaskListView(),
          ),
        ]),
      ),
      floatingActionButton: AddTaskView(),
    );
    ;
  }
}
