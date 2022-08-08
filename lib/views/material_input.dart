import 'package:flutter/material.dart';
import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import '../widgets/app_form.dart';




class MaterialInput extends StatelessWidget {
  MaterialInput({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  late String _typeController;
  late String _unitController;
  late String _sizeController;
  late String _colorController;
  final TextEditingController _explanationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hammadde Girişi"),
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
                          label: "İsim",
                          hint: "örn. Gizli Ayak",
                          controller: _nameController,
                          context: context,
                        ),
                        const SizedBox(height: 24),
                        AppForm.appSearchableDropDownField(
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
                      label: "Miktar",
                      hint: "örn. 380",
                      controller: _amountController,
                      context: context,
                    ),),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: AppForm.appSearchableDropDownField(
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
                  label: "Açıklama",
                  hint: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. ",
                  controller: _explanationController,
                  context: context,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        debugPrint('Hammadde Eklendi');
                      },
                      child: const Text("Giriş İşlemini Tamamla"),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
