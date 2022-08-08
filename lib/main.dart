import 'package:flutter/material.dart';

import 'design/app_theme_data.dart';
import 'routes/routes.dart';

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
      title: "Solvio ERP",
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme(context),
      darkTheme: AppThemeData.darkTheme(context),
      initialRoute: "home_view",
      routes: routes,
    );
  }
}
