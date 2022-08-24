import 'dart:io';
import 'dart:math';

import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';
import '../widgets/app_form.dart';

class ProductInput extends StatefulWidget {
  const ProductInput({Key? key}) : super(key: key);

  @override
  State<ProductInput> createState() => _ProductInputState();
}

class _ProductInputState extends State<ProductInput> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _productLegController = TextEditingController();
  final TextEditingController _productPillowController = TextEditingController();
  final TextEditingController _productFabricController = TextEditingController();
  final TextEditingController _productAmountController = TextEditingController();
  final TextEditingController _productUnitController = TextEditingController();
  final TextEditingController _productExplanationController = TextEditingController();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPhoneNumberController = TextEditingController();
  final TextEditingController _companyAddressController = TextEditingController();

  final TextEditingController _customerFirstNameController = TextEditingController();
  final TextEditingController _customerLastNameController = TextEditingController();
  final TextEditingController _customerEmailController = TextEditingController();
  final TextEditingController _customerPhoneNumberController = TextEditingController();
  final TextEditingController _customerAddressController = TextEditingController();

  /*final TextEditingController _firmNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _legDetailController = TextEditingController();
  final TextEditingController _materialTypeController = TextEditingController();
  // final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _pillowDetailController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();
  final TextEditingController _packageAmountController = TextEditingController();*/

  List<String> productNameSuggestions = ["Kanepe"];
  List<String> productIdSuggestions = ["A1236"];
  List<String> productLegSuggestions = ["Gizli Ayak"];
  List<String> productPillowSuggestions = ["İnce Dikiş"];
  List<String> productFabricSuggestions = ["Kadife"];
  List<String> productUnitSuggestions = ["Adet"];

  List<String> companyNameSuggestions = ["Kanepe"];
  List<String> companyEmailSuggestions = ["destek@halic.com"];
  List<String> companyPhoneNumberSuggestions = ["5123456789"];

  List<String> customerFirstNameSuggestions = ["Ali"];
  List<String> customerLastNameSuggestions = ["Demir"];
  List<String> customerEmailSuggestions = ["ali@domain.com"];
  List<String> customerPhoneNumberSuggestions = ["5123456789"];

  /*List<String> nameSuggestions = [""];
  List<String> typeSuggestions = [""];
  List<String> amountSuggestions = [""];
  List<String> unitSuggestions = [""];
  List<String> sizeSuggestions = [""];
  List<String> colorSuggestions = [""];*/

  File? image;

  void getSelectedImage(File? img) {
    setState(() {
      image = img;
    });
  }

  File? logo;

  void getSelectedLogo(File? img) {
    setState(() {
      logo = img;
    });
  }

  int randomQr = 0;

  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    randomQr = generateRandomQr();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ürün", style: AppText.titleSemiBold),
                const SizedBox(width: 16),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.lightPrimary.withOpacity(.16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      AppForm.appAutoCompleteTextFormField(
                        label: "İsim",
                        hint: "ör. Kanepe",
                        controller: _productNameController,
                        key: GlobalKey(),
                        suggestions: productNameSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Id",
                        hint: "ör. A1236",
                        controller: _productIdController,
                        key: GlobalKey(),
                        suggestions: productIdSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Ayak",
                        hint: "ör. Gizli Ayak",
                        controller: _productLegController,
                        key: GlobalKey(),
                        suggestions: productLegSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormFieldRegexNumber(
                        label: "Miktar",
                        hint: "ör. 380",
                        controller: _productAmountController,
                        key: GlobalKey(),
                        keyboardType: TextInputType.number,
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
                        getSelectedImage: getSelectedImage,
                        label: "Görsel Ekle",
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Kırlent",
                        hint: "ör. İnce Dikişli",
                        controller: _productPillowController,
                        key: GlobalKey(),
                        suggestions: productPillowSuggestions,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Miktar Birimi",
                        hint: "ör. Adet",
                        controller: _productUnitController,
                        key: GlobalKey(),
                        suggestions: productUnitSuggestions,
                        isRequired: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AppForm.appAutoCompleteTextFormField(
              label: "Kumaş",
              hint: "ör. Kadife",
              controller: _productFabricController,
              key: GlobalKey(),
              suggestions: productFabricSuggestions,
              isRequired: true,
            ),
            const SizedBox(height: 24),
            AppForm.appTextFormField(
              maxLines: 3,
              label: "Açıklama",
              hint: "Ekstra bilgileri buraya ekleyebilirsiniz. ",
              controller: _productExplanationController,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Müşteri Türü", style: AppText.titleSemiBold),
                ToggleButtons(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Firma"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text("Bireysel"),
                    ),
                  ],
                  textStyle: AppText.contextSemiBold,
                  isSelected: isSelected,
                  borderColor: AppColors.lightPrimary,
                  selectedColor: AppColors.lightSecondary,
                  selectedBorderColor: AppColors.lightPrimary,
                  color: AppColors.lightPrimary,
                  fillColor: AppColors.lightPrimary,
                  // highlightColor: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                  onPressed: (index) {
                    setState(() {
                      for(int i = 0; i < isSelected.length; i++) {
                        if(i == index) {
                          isSelected[i] = true;
                        } else {
                          isSelected[i] = false;
                        }
                      }
                    });
                  },
                ),


              ],
            ),
            const SizedBox(height: 32),
            if(isSelected[0]) Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AppForm.appAutoCompleteTextFormField(
                            label: "Firma",
                            hint: "ör. Haliç Mobilya",
                            controller: _companyNameController,
                            key: GlobalKey(),
                            suggestions: productNameSuggestions,
                            isRequired: true,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appAutoCompleteTextFormField(
                            label: "Yetkili",
                            hint: "ör. Ömer Demir",
                            key: GlobalKey(),
                            controller: _companyEmailController,
                            suggestions: companyEmailSuggestions,
                            isRequired: true,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appAutoCompleteTextFormField(
                            label: "Email",
                            hint: "halic@domain.com",
                            key: GlobalKey(),
                            controller: _companyEmailController,
                            suggestions: companyEmailSuggestions,
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
                            getSelectedImage: getSelectedLogo,
                            label: "Logo Ekle",
                          ),
                          const SizedBox(height: 24),
                          AppForm.appAutoCompleteTextFormField(
                            label: "Telefon",
                            hint: "ör. 5123456789",
                            controller: _companyPhoneNumberController,
                            key: GlobalKey(),
                            suggestions: companyPhoneNumberSuggestions,
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
                  label: "Adres",
                  hint: "ör. abc mahallesi, xyz caddesi, solvio siteleri, Kayseri / Türkiye ",
                  controller: _productExplanationController,
                  isRequired: true,
                ),
              ],
            ),
            if(isSelected[1]) Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AppForm.appAutoCompleteTextFormField(
                            label: "İsim",
                            hint: "ör. Ali",
                            controller: _companyNameController,
                            key: GlobalKey(),
                            suggestions: productNameSuggestions,
                            isRequired: true,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appAutoCompleteTextFormField(
                            label: "Email",
                            hint: "ali@domain.com",
                            controller: _customerFirstNameController,
                            key: GlobalKey(),
                            suggestions: customerFirstNameSuggestions,
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
                          AppForm.appTextFormField(
                            label: "Soyisim",
                            hint: "ör. Demir",
                            controller: _companyAddressController,
                            isRequired: true,
                          ),
                          const SizedBox(height: 24),
                          AppForm.appAutoCompleteTextFormField(
                            label: "Telefon",
                            hint: "ör. 5123456789",
                            controller: _customerEmailController,
                            key: GlobalKey(),
                            suggestions: customerEmailSuggestions,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                AppForm.appTextFormField(
                  maxLines: 3,
                  label: "Adres",
                  hint: "ör. abc mahallesi, xyz caddesi, solvio siteleri, Kayseri / Türkiye ",
                  controller: _productExplanationController,
                  isRequired: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Giriş İşlemini Tamamla"),
              ),
            ),
          ],
        ),
        /*body: ListView(
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
        ),*/
      ),
    );
  }

  int generateRandomQr() {
    int temp;
    var random = Random();
    temp = random.nextInt(999999999);
    return temp;
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productIdController.dispose();
    _productLegController.dispose();
    _productPillowController.dispose();
    _productFabricController.dispose();
    _productAmountController.dispose();
    _productUnitController.dispose();
    _productExplanationController.dispose();

    _companyNameController.dispose();
    _companyAddressController.dispose();

    _customerFirstNameController.dispose();
    _customerLastNameController.dispose();
    _customerEmailController.dispose();
    _customerPhoneNumberController.dispose();

    super.dispose();
  }

}
