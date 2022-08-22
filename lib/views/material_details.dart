import 'package:enterprise_resource_planning/utils/helpers.dart';
import 'package:flutter/material.dart';
import '../design/app_colors.dart';
import '../models/app_material.dart';
import '../services/base_service.dart';
import '../services/material_service.dart';
import '../widgets/app_alerts.dart';
import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';
import 'barcode_scanner.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detayları Göster"),
        ),
        body: FutureBuilder(
          future: getByReferenceNumber(BarcodeScanner.referenceNumber),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if(snapshot.hasError) {
              return const Text('Something went wrong');
            } else if(snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if(snapshot.data!["data"] == null) {
              return Container(
                margin: const EdgeInsets.all(24),
                child: AppAlerts.error("Herhangi bir kayıt bulunamadı."),
              );
            } else {
              AppMaterial material = AppMaterial.fromJson(snapshot.data!["data"]);

              _nameController.text = Helpers.titleCase(material.materialName);
              _typeController.text = Helpers.titleCase(material.typeName);
              _amountController.text = material.amount.toString();
              _unitController.text = Helpers.titleCase(material.unitName);
              _sizeController.text = material.sizeName;
              _colorController.text = Helpers.titleCase(material.colorName);
              _explanationController.text = material.description;

              // String imageUrl = BaseService.baseUrl + snapshot.data!["data"]["materialImageUrlPath"];

              String imageUrl = "${BaseService.baseUrl}/api/v1/images/materials/${material.materialId}";

              return ListView(
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
                            Container(
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
                              child: material.imageUrl.isNotEmpty ? Image.network(material.imageUrl, fit: BoxFit.cover) : Image.asset("assets/images/placeholder-image.jpg"),
                            ),
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
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getByReferenceNumber(int referenceNumber) async {
    return await MaterialService.getByReferenceNumber(referenceNumber);
  }
}