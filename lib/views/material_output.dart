import 'package:enterprise_resource_planning/widgets/app_alerts.dart';
import 'package:flutter/material.dart';
import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';

class MaterialOutput extends StatelessWidget {
  MaterialOutput({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = "Gizli Ayak";
    _typeController.text = "Uzun";
    _sizeController.text = "12 cm";
    _unitController.text = "Adet";
    _colorController.text = "Ceviz";
    _explanationController.text = "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hammadde Çıkış"),
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
                      AppForm.appTextFormField(
                        label: "İsim",
                        hint: "ör. Gizli Ayak",
                        controller: _nameController,
                        isEnabled: false,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                        label: "Cins",
                        hint: "ör. Uzun",
                        controller: _typeController,
                        isEnabled: false,
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
                      AppForm.appTextFormField(
                        label: "Boyut",
                        hint: "ör. 12 cm",
                        controller: _sizeController,
                        isEnabled: false,
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
                      const ImagePickerWidget(),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                        label: "Miktar Birimi",
                        hint: "ör. Adet",
                        controller: _unitController,
                        isEnabled: false,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                        label: "Renk",
                        hint: "ör. Ceviz",
                        controller: _colorController,
                        isEnabled: false,
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
              hint: "Ekstra bilgileri buraya ekleyebilirsiniz.",
              controller: _explanationController,
              isEnabled: false,
            ),
            const SizedBox(height: 24),
            AppAlerts.info("Stokta 380 Adet Gizli Ayak vardır"),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Çıkış İşlemini Tamamla"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}