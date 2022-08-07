import 'package:flutter/material.dart';
import '../design/app_text.dart';

import '../widgets/app_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Header", style: AppText.headerSemiBold),
                Text("Header", style: AppText.header),
                Text("Title", style: AppText.titleSemiBold),
                Text("Title", style: AppText.title),
                Text("Context", style: AppText.contextSemiBold),
                Text("Context", style: AppText.context),
                Text("Label", style: AppText.labelSemiBold),
                Text("Label", style: AppText.label),
                Text("Helper", style: AppText.helperSemiBold),
                Text("Helper", style: AppText.helper),
                const SizedBox(height: 16),
                Text("Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.", style: AppText.context),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: (){},
                  child: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: (){},
                  child: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: (){},
                  child: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  label: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  label: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  label: const Text("Button Name"),
                ),
                const SizedBox(height: 16),
                AppForm.appSearchableDropDownField(
                  items: ["Abdulkadir", "Ömer Faruk", "Furkan"],
                  label: "",
                  onChanged: (value){},
                  selectedItem: "",
                  context: context,
                ),
                const SizedBox(height: 16),
                AppForm.appTextFormFieldIcon(
                  label: "Şifre",
                  hint: "Şifreniz 6 ila 18 karakter arası olmalı",
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  controller: TextEditingController(),
                  context: context,
                  isPrefixIcon: false,
                ),
                const SizedBox(height: 16),
                AppForm.appTextFormFieldIcon(
                  label: "Email",
                  hint: "ör. isminiz@domain.com",
                  icon: const Icon(Icons.email_outlined),
                  controller: TextEditingController(),
                  context: context,
                ),
                const SizedBox(height: 16),
                AppForm.appTextFormField(
                  label: "Şifre",
                  hint: "Şifreniz 6 ila 18 karakter arası olmalı",
                  controller: TextEditingController(),
                  context: context,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value){},
                    ),
                    const SizedBox(width: 16),
                    Checkbox(
                      value: false,
                      onChanged: (value){},
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
