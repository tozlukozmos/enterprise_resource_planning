import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../widgets/app_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

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
                  child: Column(
                    children: [
                      Text("Hoş geldiniz", style: AppText.titleSemiBold),
                      const SizedBox(height: 4),
                      Text("Giriş yapmak için email & şifrenizi giriniz.", style: AppText.context),
                      const SizedBox(height: 32),
                      AppForm.appTextFormField(
                        label: "Email",
                        hint: "isminiz@domain.com",
                        controller: TextEditingController(),
                        isEmail: true,
                      ),
                      const SizedBox(height: 24),
                      Stack(
                        children: [
                          AppForm.appTextFormFieldIcon(
                            label: "Şifre",
                            hint: "Şifreniz 6 ila 18 karakter arası olmalı",
                            icon: const Icon(FluentIcons.eye_off_24_regular),
                            controller: TextEditingController(),
                            isPrefixIcon: false,
                            isPassword: true,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Text("Şifremi Unuttum", style: AppText.label),
                          ),
                        ],
                      ),
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
                        child: ElevatedButton(
                          onPressed: () {Navigator.pushReplacementNamed(context, "home_view");},
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
            height: 69,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(24),
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
