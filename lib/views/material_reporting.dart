import 'package:enterprise_resource_planning/widgets/app_alerts.dart';
import 'package:flutter/material.dart';
import '../design/app_colors.dart';
import '../models/app_material.dart';
import '../models/app_process.dart';
import '../models/user.dart';
import '../services/base_service.dart';
import '../services/material_service.dart';
import '../services/process_service.dart';
import '../storage/storage.dart';
import '../utils/helpers.dart';
import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';
import 'barcode_scanner.dart';

class MaterialReporting extends StatefulWidget {
  const MaterialReporting({Key? key}) : super(key: key);

  @override
  State<MaterialReporting> createState() => _MaterialReportingState();
}

class _MaterialReportingState extends State<MaterialReporting> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _errorTypeController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();

  int currentStock = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hammadde Hata Bildir"),
        ),
        body: FutureBuilder(
          future: getByReferenceNumber(BarcodeScanner.referenceNumber),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.data!["data"] == null) {
              return Container(
                margin: const EdgeInsets.all(24),
                child: AppAlerts.error("Herhangi bir kayıt bulunamadı."),
              );
            } else {
              AppMaterial material = AppMaterial.fromJson(snapshot.data!["data"]);

              _nameController.text = Helpers.titleCase(material.materialName);
              _typeController.text = Helpers.titleCase(material.typeName);
              // _amountController.text = material.amount.toString();
              _unitController.text = Helpers.titleCase(material.unitName);
              _sizeController.text = material.sizeName;
              _colorController.text = Helpers.titleCase(material.colorName);
              _explanationController.text = material.description;

              /*_nameController.text = material.materialName;
              _typeController.text = material.typeName;
              _sizeController.text = material.sizeName;
              _unitController.text = material.unitName;
              _colorController.text = material.colorName;
              _explanationController.text = material.description;*/
              currentStock = material.amount;

              String imageUrl = BaseService.baseUrl + snapshot.data!["data"]["materialImageUrlPath"];

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
                            AppForm.appTextFormFieldRegexNumber(
                              label: "Miktar",
                              hint: "ör. 380",
                              controller: _amountController,
                              key: GlobalKey(),
                              keyboardType: TextInputType.number,
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
                              child: Image.network(imageUrl, fit: BoxFit.cover),
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
                  AppForm.appAutoCompleteTextFormField(
                    label: "Hata Türü",
                    hint: "ör. Kırık",
                    controller: _errorTypeController,
                    key: GlobalKey(),
                    suggestions: ["Bozuk", "Yırtık", "Açılmış", "Kırık"],
                    isRequired: true,
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
                  AppAlerts.info("Stokta ${material.amount} ${Helpers.titleCase(material.unitName)} ${Helpers.titleCase(material.materialName)} vardır"),
                  //AppAlerts.info("Stokta ${material.amount} ${material.unitName} ${material.materialName} vardır"),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        updateMaterial(material);
                      },
                      child: const Text("Hata Bildirimini Tamamla"),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<String> getUserId() async {
    final SecureStorage secureStorage = SecureStorage();
    return await secureStorage.readSecureData('userId');
  }

  Future<Map<String, dynamic>> getByReferenceNumber(int referenceNumber) async {
    return await MaterialService.getByReferenceNumber(referenceNumber);
  }

  void updateMaterial(AppMaterial material) {
    if (_amountController.text.isNotEmpty &&
        _errorTypeController.text.isNotEmpty) {
      if (currentStock >= int.parse(_amountController.text)) {
        material.amount = currentStock - int.parse(_amountController.text);
        print(material.amount);
        MaterialService.updateMaterial(material).then((value) {
          print(value);
          if (value["success"]) {
            addProcess(AppMaterial.fromJson(value["data"]));
            AppAlerts.toast(message: value["message"]);
          } else {
            AppAlerts.toast(message: value["message"]);
          }
        });
      } else {
        AppAlerts.toast(message: "Yeterli stok bulunmamaktadır.");
      }
    } else {
      AppAlerts.toast(message: "Lütfen zorunlu alanları doldurunuz.");
    }
  }

  void addProcess(AppMaterial material) async {
    User userData = User(
      userId: int.parse(await getUserId()),
      username: "",
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      phoneNumber: "",
      departmentName: "",
      imageUrl: "",
      isAdmin: false,
      createdAt: "",
      updatedAt: "",
    );

    AppProcess processData = AppProcess(
      processId: 0,
      user: userData,
      material: material,
      amount: int.parse(_amountController.text),
      processTypeName: "hata bildirimi",
      createdAt: "",
      updatedAt: "",
    );

    ProcessService.addProcess(processData).then((value) {
      if (value["success"]) {
        Navigator.pushReplacementNamed(context, 'home_view');
      } else {
        AppAlerts.toast(message: value["message"]);
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
