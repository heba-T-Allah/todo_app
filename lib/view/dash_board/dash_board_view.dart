import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(ImageAssets.shape),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  Center(child: SvgPicture.asset(ImageAssets.loginImg)),
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s12),
                    child: Container(
                      width: 400,
                      height: 70,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        // border: Border.fromBorderSide(BorderSide(
                        //     width: 2, color: ColorManager.primary))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Text(
                                  AppStrings.totalTasks,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  appViewModel.numTasks.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s12),
                    child: Container(
                      width: 400,
                      height: 70,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        // border: Border.fromBorderSide(BorderSide(
                        //     width: 2, color: ColorManager.primary))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Text(
                                  AppStrings.completedTasks,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  appViewModel.completedTasks.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s12),
                    child: Container(
                      width: 400,
                      height: 70,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        // border: Border.fromBorderSide(BorderSide(
                        //     width: 2, color: ColorManager.primary))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Text(
                                  AppStrings.nonCompletedTasks,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  appViewModel.remainingTasks.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]));
      },
    );
  }
}
