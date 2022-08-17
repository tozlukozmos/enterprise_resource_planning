import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:flutter/material.dart';

import '../widgets/app_form.dart';

class ProductOutput extends StatefulWidget {
  const ProductOutput({Key? key}) : super(key: key);

  @override
  State<ProductOutput> createState() => _ProductOutputState();
}

class _ProductOutputState extends State<ProductOutput> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bitmiş Ürün Çıkış"),
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
                      Container(
                        width: 171,
                        height: 156,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 2),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/add-image.jpg',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Ürün Adı",
                          hint: "ör. Kanepe",
                          controller: _nameController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Firma Adı",
                          hint: "ör. Haliç Mobilya",
                          controller: _firmNameController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Şehir",
                          hint: "ör. Kayseri",
                          controller: _cityController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Ayak Detayı",
                          hint: "ör. Gizli Ayak",
                          controller: _legDetailController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Ürün Kumaşı",
                          hint: "ör. Kadife",
                          controller: _materialTypeController,
                          isEnabled: false),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        width: 171,
                        height: 156,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 2),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/add-image.jpg',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Ürün Kodu",
                          hint: "ör. A1236",
                          controller: _productIdController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Müşteri Adı",
                          hint: "ör. Burak Demir",
                          controller: _customerNameController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Ülke",
                          hint: "ör. Türkiye",
                          controller: _countryController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormField(
                          label: "Kırlent Detayı",
                          hint: "ör. İnce Dikiş",
                          controller: _pillowDetailController,
                          isEnabled: false),
                      const SizedBox(height: 24),
                      AppForm.appTextFormFieldRegexNumber(
                          label: "Paket sayısı",
                          hint: "ör. 380",
                          controller: _packageAmountController,
                          key: GlobalKey(),
                          keyboardType: TextInputType.number,
                          isRequired: true),
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
                isEnabled: false),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Çıkışİşlemini Tamamla"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
