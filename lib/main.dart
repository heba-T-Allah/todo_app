import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_model/app_view_model.dart';

import 'app/app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child:  MyApp()));
}
