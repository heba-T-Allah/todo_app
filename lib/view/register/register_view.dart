import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/sqlite/user.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../sqlite/dbhelper.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  void showInSnackBar(String? value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value!)));
  }

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
                          AppStrings.createYourAccount,
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
                            controller: userNameController,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10, top: 4),
                                fillColor: ColorManager.white,
                                filled: true,
                                hintText: AppStrings.userName,
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
                            controller: confirmPasswordController,
                            style: Theme.of(context).textTheme.bodySmall,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.password),
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10, top: 4),
                                fillColor: ColorManager.white,
                                filled: true,
                                hintText: AppStrings.confirmPassword,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p14),
                        child: MaterialButton(
                          onPressed: () {
                            _signUp();

                          },
                          child: Text(
                            AppStrings.signUp,
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
                            AppStrings.alreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.loginRoute);
                            },
                            child: Text(
                              AppStrings.signInBtn,
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

  void _insertUser(String email, String username, String password) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnUserName: username,
      DatabaseHelper.columnPassword: password,
    };
    Userdb user = Userdb.fromMap(row);
    final id = await dbHelper.insert(user);

    print('inserted row id: $id ');
  }

  void _signUp() {
    if (emailController.text.isNotEmpty) {
      if (userNameController.text.isNotEmpty) {
        if (passwordController.text.isNotEmpty) {
          if (confirmPasswordController.text.isNotEmpty) {
            if (passwordController.text == confirmPasswordController.text) {
              _insertUser(emailController.text, userNameController.text,
                  passwordController.text);
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            } else {
              showInSnackBar("Password mismatch.");
            }
          } else {
            showInSnackBar("please confirm your password.");
          }
        } else {
          showInSnackBar("please enter your password.");
        }
      } else {
        showInSnackBar("please enter your user name.");
      }
    } else {
      showInSnackBar("please enter your email.");
    }
  }
}
