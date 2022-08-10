import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import '../widgets/app_form.dart';

class MaterialInput extends StatefulWidget {
  MaterialInput({Key? key}) : super(key: key);

  @override
  State<MaterialInput> createState() => _MaterialInputState();
}

class _MaterialInputState extends State<MaterialInput> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _typeController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _unitController = TextEditingController();

  final TextEditingController _sizeController = TextEditingController();

  final TextEditingController _colorController = TextEditingController();

  final TextEditingController _explanationController = TextEditingController();

  int randomQr = 0;

  @override
  void initState() {
    super.initState();
    randomQr = generateRandomQr();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hammadde Girişi"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      AppForm.appAutoCompleteTextFormField(
                        label: "İsim",
                        hint: "ör. Gizli Ayak",
                        controller: _nameController,
                        key: GlobalKey(),
                        suggestions: [
                          "Çivi",
                          "Sunta",
                          "Sünger",
                          "Vida",
                          "Gizli Ayak"
                        ],
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Cins",
                        hint: "ör. Uzun",
                        controller: _typeController,
                        key: GlobalKey(),
                        suggestions: ["Uzun", "Kısa", "Orta", "Gözenekli"],
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Miktar",
                        hint: "ör. 380",
                        controller: _amountController,
                        key: GlobalKey(),
                        suggestions: ["200", "24", "380", "120"],
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Boyut",
                        hint: "ör. 12 cm",
                        controller: _sizeController,
                        key: GlobalKey(),
                        suggestions: ["14 cm", "16 cm", "20 cm", "5 m"],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 171,
                          height: 156,
                          decoration: BoxDecoration(
                            color: AppColors.lightPrimary.withOpacity(0.04),
                            border: Border.all(
                              color: AppColors.lightPrimary,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                FluentIcons.image_24_regular,
                                size: 53,
                                color: AppColors.lightPrimary,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FluentIcons.add_24_regular,
                                    size: 28,
                                    color: AppColors.lightPrimary,
                                  ),
                                  Text('Görsel Ekle',
                                      style: AppText.contextSemiBold),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Miktar Birimi",
                        hint: "ör. Adet",
                        controller: _unitController,
                        key: GlobalKey(),
                        suggestions: ["Paket", "Adet", "Metre", "Kg"],
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Renk",
                        hint: "ör. Ceviz",
                        controller: _colorController,
                        key: GlobalKey(),
                        suggestions: ["Kırmızı", "Yeşil", "Mor", "Mavi"],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppForm.appTextFormField(
              maxLines: 3,
              label: "Açıklama",
              hint: "Ekstra bilgileri buraya ekleyebilirsiniz. ",
              controller: _explanationController,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Giriş İşlemini Tamamla"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int generateRandomQr() {
    int temp;
    var random = Random();
    temp = random.nextInt(999999999);
    return temp;
  }
}
