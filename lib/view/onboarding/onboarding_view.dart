import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/resources/strings_manager.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
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
          Center(child: Image.asset(ImageAssets.splashLogo)),
          SizedBox(
            height: AppSize.s100,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Center(
              child: Text(
                AppStrings.onboardingTextTitle,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Center(
              child: Text(
                AppStrings.onboardingTextSubTitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s20,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);


              },
              child: Text(
                AppStrings.getStartedBtn,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              height: AppSize.s50,
              minWidth: 400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)),
              textColor: ColorManager.white,
              color: ColorManager.primary,
            ),
          )
        ],
      ),
    );
  }
}
