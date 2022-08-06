import 'package:flutter/material.dart';

import 'app_theme_data.dart';
import 'routes/routes.dart';
import 'views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme(context),
      home: const Login(),
      routes: routes,
    );
  }
}
