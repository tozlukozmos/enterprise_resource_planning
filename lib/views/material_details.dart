import 'package:flutter/material.dart';
import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import '../widgets/app_form.dart';

class MaterialDetails extends StatelessWidget {
  MaterialDetails({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late String _typeController;
  late String _unitController;
  late String _sizeController;
  late String _colorController;
  final TextEditingController _explanationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Gizli Ayak';
    _typeController = 'Amazon';
    _amountController.text = '35';
    _unitController = 'Adet';
    _sizeController = '15CM';
    _colorController = 'Ceviz Kahverengi';
    _explanationController.text = 'Bu Gizli Ayakların 15cm likleri sadece X modelimiz için kullanıyoruz.';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detayları Göster"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            AppForm.appTextFormField(
                              enabled: false,
                              label: "İsim",
                              hint: "örn. Gizli Ayak",
                              controller: _nameController,
                              context: context,
                            ),
                            const SizedBox(height: 24),
                            AppForm.appSearchableDropDownField(
                              enabled: false,
                              items: ["Abdulkadir", "Ömer Faruk", "Furkan"],
                              label: "Cins",
                              onChanged: (value){},
                              selectedItem: _typeController,
                              context: context,
                            ),
                          ],
                        )),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          debugPrint('Görsel Ekle');
                        },
                        child: Container(
                            width: 171,
                            height: 156,
                            decoration: BoxDecoration(
                                color: AppColors.lightPrimary.withOpacity(0.04),
                                border: Border.all(
                                    color: AppColors.lightPrimary,
                                    style: BorderStyle.solid
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.image, size: 53, color: AppColors.lightPrimary,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add,size: 36, color: AppColors.lightPrimary,),
                                    Text('Görsel Ekle', style: AppText.contextSemiBold,),
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppForm.appTextFormField(
                        enabled: false,
                        label: "Miktar",
                        hint: "örn. 380",
                        controller: _amountController,
                        context: context,
                      ),),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: AppForm.appSearchableDropDownField(
                        enabled: false,
                        items: ["Abdulkadir", "Ömer Faruk", "Furkan"],
                        label: 'Miktar Birimi',
                        onChanged: (value){},
                        selectedItem: _unitController,
                        context: context,
                      ),),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppForm.appSearchableDropDownField(
                        enabled: false,
                        items: ["Abdulkadir", "Ömer Faruk", "Furkan"],
                        label: "Boyut",
                        onChanged: (value){},
                        selectedItem: _sizeController,
                        context: context,
                      ),),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: AppForm.appSearchableDropDownField(
                        enabled: false,
                        items: ["Abdulkadir", "Ömer Faruk", "Furkan"],
                        label: "Renk",
                        onChanged: (value){},
                        selectedItem: _colorController,
                        context: context,
                      ),),
                  ],
                ),
                const SizedBox(height: 24),
                AppForm.appTextFormField(
                  enabled: false,
                  label: "Açıklama",
                  hint: "Ekstra bilgileri buraya ekleyebilirsiniz.",
                  controller: _explanationController,
                  context: context,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}