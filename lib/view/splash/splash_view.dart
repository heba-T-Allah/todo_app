import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/resources/values_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(seconds: AppConstants.splashDelay),
      () => _goNext(),
    );
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

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
            height: AppSize.s100,
          ),
          Center(child: Image.asset(ImageAssets.splashLogo)),
          SizedBox(
            height: AppSize.s50,
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: AppSize.s4,
              ),
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: AppSize.s4,
              ),
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
