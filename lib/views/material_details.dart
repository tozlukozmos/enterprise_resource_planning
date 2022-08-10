import 'package:flutter/material.dart';
import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';

class MaterialDetails extends StatelessWidget {
  MaterialDetails({Key? key}) : super(key: key);

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
    _amountController.text = "380";
    _sizeController.text = "12 cm";
    _unitController.text = "Adet";
    _colorController.text = "Ceviz";
    _explanationController.text = "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir.";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detayları Göster"),
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
                      AppForm.appTextFormField(
                        label: "Miktar",
                        hint: "ör. 380",
                        controller: _amountController,
                        isEnabled: false,
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
          ],
        ),
      ),
    );
  }
}