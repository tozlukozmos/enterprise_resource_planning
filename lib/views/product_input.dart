import 'dart:io';

import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:flutter/material.dart';

import '../widgets/app_form.dart';

class ProductInput extends StatefulWidget {
  const ProductInput({Key? key}) : super(key: key);

  @override
  State<ProductInput> createState() => _ProductInputState();
}

class _ProductInputState extends State<ProductInput> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _legDetailController = TextEditingController();
  final TextEditingController _materialTypeController = TextEditingController();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _pillowDetailController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();
  final TextEditingController _packageAmountController =
      TextEditingController();

  List<String> nameSuggestions = [""];
  List<String> typeSuggestions = [""];
  List<String> amountSuggestions = [""];
  List<String> unitSuggestions = [""];
  List<String> sizeSuggestions = [""];
  List<String> colorSuggestions = [""];

  File? image;

  void getSelectedImage(File? img) {
    setState(() {
      image = img;
    });
  }

  File? image2;

  void getSelectedImage2(File? img) {
    setState(() {
      image2 = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bitmiş Ürün Giriş"),
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
                      const SizedBox(height: 8),
                      ImagePickerWidget(
                        label: "Logo Ekle",
                        getSelectedImage: getSelectedImage,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ürün Adı",
                        hint: "ör. Kanepe",
                        controller: _nameController,
                        key: GlobalKey(),
                        suggestions: nameSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Firma Adı",
                        hint: "ör. Haliç Mobilya",
                        controller: _firmNameController,
                        key: GlobalKey(),
                        suggestions: typeSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Şehir",
                        hint: "ör. Kayseri",
                        controller: _cityController,
                        key: GlobalKey(),
                        suggestions: typeSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ayak Detayı",
                        hint: "ör. Gizli Ayak",
                        controller: _legDetailController,
                        key: GlobalKey(),
                        suggestions: sizeSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ürün Kumaşı",
                        hint: "ör. Kadife",
                        controller: _materialTypeController,
                        key: GlobalKey(),
                        suggestions: sizeSuggestions,
                        isRequired: true,
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
                      ImagePickerWidget(
                        label: "Görsel Ekle",
                        getSelectedImage: getSelectedImage2,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ürün Kodu",
                        hint: "ör. A1236",
                        controller: _productIdController,
                        key: GlobalKey(),
                        suggestions: unitSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Müşteri Adı",
                        hint: "ör. Burak Demir",
                        controller: _customerNameController,
                        key: GlobalKey(),
                        suggestions: colorSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ülke",
                        hint: "ör. Türkiye",
                        controller: _countryController,
                        key: GlobalKey(),
                        suggestions: colorSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Kırlent Detayı",
                        hint: "ör. İnce Dikiş",
                        controller: _pillowDetailController,
                        key: GlobalKey(),
                        suggestions: colorSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormFieldRegexNumber(
                        label: "Paket sayısı",
                        hint: "ör. 380",
                        controller: _packageAmountController,
                        key: GlobalKey(),
                        keyboardType: TextInputType.number,
                        isRequired: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppForm.appTextFormField(
              maxLines: 3,
              label: "Özel Açıklama",
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
}
