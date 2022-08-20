import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './views/home.dart';
import './views/login.dart';
import 'design/app_theme_data.dart';
import 'routes/routes.dart';
import 'storage/storage.dart';

void main() {

  initializeDateFormatting('tr_TR', null).then((_) => runApp(const MyApp()));
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureStorage secureStorage = SecureStorage();

  Future<String> getToken() async {
    return await secureStorage.readSecureData('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getToken(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: "Solvio ERP",
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.lightTheme(context),
          themeMode: ThemeMode.light,
          darkTheme: AppThemeData.darkTheme(context),
          home: snapshot.data == null ? const Login() : const Home(),
          // initialRoute: snapshot.data == null ? "login_view" : "home_view",
          routes: routes,
          //supportedLocales: const [Locale("en", "US"), Locale("tr", "TR")],


        );
      },
    );
  }
}
