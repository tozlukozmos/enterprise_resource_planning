import 'dart:io';
import 'package:enterprise_resource_planning/widgets/app_alerts.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../services/user_service.dart';
import '../widgets/app_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background-login.jpg"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/images/logo-login.png", height: 50),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset("assets/images/hero-login.svg", height: 120),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("Hoş geldiniz", style: AppText.titleSemiBold),
                      const SizedBox(height: 4),
                      Text("Giriş yapmak için kullanıcı adınızı & şifrenizi giriniz.", style: AppText.helper),
                      const SizedBox(height: 32),
                      AppForm.appTextFormFieldRegex(
                        formatter:FilteringTextInputFormatter.allow(RegExp(r'\S')),
                        label: "Kullanıcı Adı",
                        hint: "ör. isimsoyisim",
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 24),
                      PasswordFieldWithVisibility(controller: _passwordController),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          Text("Beni Hatırla", style: AppText.label)
                        ],
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: isLoading ? ElevatedButton(
                            onPressed: (){}
                            , child: Container(
                          height: 20,
                          width: 20,
                          child: const CircularProgressIndicator(
                            color: AppColors.lightSecondary,
                            strokeWidth: 3,
                          ),
                        )) :ElevatedButton(
                          onPressed: (){
                            setState(()=>isLoading = true );
                            logIn();},
                          child: const Text("Giriş Yap"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 45,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 24),
            child: const Text(
              "Copyright © Solvio Yazılım",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
                color: AppColors.lightSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logIn() async {
    try {

      if (_formKey.currentState!.validate()) {

        await UserService.logIn(
          _usernameController.text,
          _passwordController.text,
        ).then((value) => {
          if (value["success"]){
            setState(()=>isLoading = false ),
            Navigator.pushReplacementNamed(context, 'home_view'),
            AppAlerts.toast(message: value["message"]),
          } else {
            setState(()=>isLoading = false ),
            AppAlerts.toast(message: value["message"]),
          },
        },
        );
      }else
        setState(()=>isLoading = false );
    } on SocketException catch (e) {

      AppAlerts.toast(message: "İnternet bağlantınızı kontrol ediniz.");
    } catch (e) {
      setState(()=>isLoading = false );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(20),
          content: Text(e.toString()),
          duration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
