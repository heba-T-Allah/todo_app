import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../main/task_list_view.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: ColorManager.primary,
                        child: Stack(fit: StackFit.expand, children: [
                          SvgPicture.asset(
                            ImageAssets.profileShape,
                          ),
                          Center(
                            child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(ImageAssets.profileImg),
                                // NetworkImage(
                                //     'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                                radius: AppSize.s40),
                          ),
                          Positioned.directional(
                            textDirection: TextDirection.ltr,
                            top: 200,
                            start: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.welcome,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  "${appViewModel.getUserName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        // alignment: AlignmentDirectional.centerStart,
                        color: ColorManager.backgroundColor,
                        child: Column(
                          children: [
                            SizedBox(
                              height: AppSize.s20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: AppPadding.p12),
                              child: Text(
                                AppStrings.myEmail,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s10,
                            ),
                            Text(
                              AppStrings.job,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: AppSize.s40,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p18),
                              child: Text(
                                "this is a Todo app with MVVM architecture, "
                                    "login and register screens developed with sqlite database.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      )),
                ]));
      },
    );
  }
}
