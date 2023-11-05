import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/strings_manager.dart';
import 'package:todo_app/sqlite/user.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../sqlite/dbhelper.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
            print("tapped");
          },
          child: Scaffold(
              backgroundColor: ColorManager.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(ImageAssets.shape),
                      Center(
                        child: Text(
                          AppStrings.enterYourCredintials,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s20,
                      ),
                      Center(child: SvgPicture.asset(ImageAssets.loginImg)),
                      SizedBox(
                        height: AppSize.s40,
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 350,
                          child: TextField(
                            autofocus: true,
                            autocorrect: false,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: ColorManager.hintBlack,
                            controller: emailController,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10, top: 4),
                                fillColor: ColorManager.white,
                                filled: true,
                                hintText: AppStrings.email,
                                hintStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 350,
                          child: TextField(
                            autofocus: true,
                            autocorrect: false,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            cursorColor: ColorManager.hintBlack,
                            controller: passwordController,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password),
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10, top: 4),
                                fillColor: ColorManager.white,
                                filled: true,
                                hintText: AppStrings.password,
                                hintStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p14, right: AppPadding.p14),
                        child: MaterialButton(
                          onPressed: () {
                            _checkLogin();
                          },
                          child: Text(
                            AppStrings.signInBtn,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          height: AppSize.s50,
                          minWidth: 400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s12)),
                          textColor: ColorManager.white,
                          color: ColorManager.primary,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.doesnotHaveAccount,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.registerRoute);
                            },
                            child: Text(
                              AppStrings.signUp,
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ]),
              )),
        );
      },
    );
  }

  void _checkLogin() {
    if (emailController.text.isNotEmpty) {
      if (passwordController.text.isNotEmpty) {
        _login(emailController.text, passwordController.text);
      } else {
        showInSnackBar("please enter your password.");
      }
    } else {
      showInSnackBar("please enter your email.");
    }
  }

  void _login(String email, String password) {
    Future<Userdb?> user = dbHelper.getLogin(email, password);
    if (user != null) {
      showInSnackBar("login Successfully.");
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    } else {
      showInSnackBar("Email or password are wrong.");
    }
  }

  void showInSnackBar(String? value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value!)));
  }
}
