
import 'package:flutter/material.dart';
import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //named constructor
  MyApp._internal();

  //create one instance
  static final _instance = MyApp._internal(); //singlton

  //factory returns the same object every time
  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
