import 'package:flutter/material.dart';

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
            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/my-first-project-5d32d.appspot.com/o/1659973205794?alt=media&token=87b033f3-1cab-4a1a-91a3-2a1d5e92b3cd"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/my-first-project-5d32d.appspot.com/o/1659976414000?alt=media&token=90a91945-3411-432f-8b3e-18afde8e4e85"),
              ),
              Image.network("https://firebasestorage.googleapis.com/v0/b/my-first-project-5d32d.appspot.com/o/1659976603647?alt=media&token=c559ba6a-dd19-4f93-914f-fde086d45051"),
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
                      context: context,
                    ),
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        AppForm.appTextFormFieldIcon(
                          label: "Şifre",
                          hint: "Şifreniz 6 ila 18 karakter arası olmalı",
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          controller: TextEditingController(),
                          context: context,
                          isPrefixIcon: false,
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
      ),
    );
  }
}
