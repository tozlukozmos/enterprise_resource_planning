import 'dart:io';
import 'dart:math';

import 'package:enterprise_resource_planning/models/app_material.dart';
import 'package:enterprise_resource_planning/models/app_process.dart';
import 'package:enterprise_resource_planning/services/material_service.dart';
import 'package:enterprise_resource_planning/services/process_service.dart';
import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import '../design/app_colors.dart';
import '../models/user.dart';
import '../storage/storage.dart';
import '../widgets/app_alerts.dart';
import '../widgets/app_form.dart';

class MaterialInput extends StatefulWidget {
  const MaterialInput({Key? key}) : super(key: key);

  @override
  State<MaterialInput> createState() => _MaterialInputState();
}

class _MaterialInputState extends State<MaterialInput> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _explanationController = TextEditingController();

  List<String> nameSuggestions = ["Çivi", "Sunta", "Sünger", "Gizli Ayak",];
  List<String> typeSuggestions = ["Uzun", "Kısa", "Orta", "Gözenekli"];
  List<String> amountSuggestions = ["200", "24", "380", "120"];
  List<String> unitSuggestions = ["Paket", "Adet", "Metre", "Kg"];
  List<String> sizeSuggestions = ["14 cm", "16 cm", "20 cm", "5 m"];
  List<String> colorSuggestions = ["Kırmızı", "Yeşil", "Mor", "Mavi"];

  File? image;
  bool isLoading = false ;
  void getSelectedImage(File? img) {
    setState(() {
      image = img;
    });
  }

  int randomQr = 0;

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
          title: const Text("Hammadde Giriş"),
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
                        suggestions: nameSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Cins",
                        hint: "ör. Uzun",
                        controller: _typeController,
                        key: GlobalKey(),
                        suggestions: typeSuggestions,
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
                      AppForm.appAutoCompleteTextFormField(
                        label: "Boyut",
                        hint: "ör. 12 cm",
                        controller: _sizeController,
                        key: GlobalKey(),
                        suggestions: sizeSuggestions,
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
                        label: "Miktar Birimi",
                        hint: "ör. Adet",
                        controller: _unitController,
                        key: GlobalKey(),
                        suggestions: unitSuggestions,
                        isRequired: true,
                      ),
                      const SizedBox(height: 24),
                      AppForm.appAutoCompleteTextFormField(
                        label: "Renk",
                        hint: "ör. Ceviz",
                        controller: _colorController,
                        key: GlobalKey(),
                        suggestions: colorSuggestions,
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
                onPressed: (){

                  setState(()=>isLoading = true );
                  addMaterial();},
                child: isLoading? Container(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator(
                    color: AppColors.lightSecondary,
                    strokeWidth: 3,
                  ),
                ) :const Text("Giriş İşlemini Tamamla"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> uploadFile() async {
    if (image == null) return "";

    final fileName = path.basename(image!.path);
    final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref(destination).child('file/');
    await ref.putFile(image!);
    var url = FirebaseStorage.instance.ref(destination).child('file/').getDownloadURL();

    return url;

  }

  Future<String> getUserId() async {
    final SecureStorage secureStorage = SecureStorage();
    return await secureStorage.readSecureData('userId');
  }

  void addMaterial() async {
    // print(image);
    // print(Image.asset("assets/images/placeholder-image.jpg"));

    if(_nameController.text.isNotEmpty && _amountController.text.isNotEmpty && _unitController.text.isNotEmpty) {
      AppMaterial materialData = AppMaterial(
        materialId: 0,
        referenceNumber: randomQr,
        imageUrl: await uploadFile(),
        // imageName: "",
        // imageData: "",
        materialName: _nameController.text.toLowerCase(),
        typeName: _typeController.text.toLowerCase(),
        unitName: _unitController.text.toLowerCase(),
        amount: _amountController.text.isEmpty ? 0 : int.parse(_amountController.text),
        colorName: _colorController.text.toLowerCase(),
        sizeName: _sizeController.text.toLowerCase(),
        description: _explanationController.text,
        createdAt: "",
        updatedAt: "",
      );

      MaterialService.addMaterial(materialData, image).then((value) {
        print('value: ${value}');
        if (value["success"]){
          setState(()=>isLoading = false );
          addProcess(AppMaterial.fromJson(value["data"]));
          Navigator.pushReplacementNamed(context, 'home_view');
          print('appProcess: ${value["data"]}');
          AppAlerts.toast(message: value["message"]);
          print('appProcess1: ${value["message"]}');
        } else {
          setState(()=>isLoading = false );
          AppAlerts.toast(message: value["message"]);
          print('appProcess2: ${value["message"]}');
        }
      });
    } else {
      setState(()=>isLoading = false );
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
      // imageName: "",
      // imageData: "",
      isAdmin: false,
      createdAt: "",
      updatedAt: "",

    );

    AppProcess processData = AppProcess(
      processId: 0,
      user: userData,
      material: material,
      amount: int.parse(_amountController.text),
      processTypeName: "giriş",
      createdAt: "",
      updatedAt: "",
    );

    ProcessService.addProcess(processData).then((value) {
      if (value["success"]){
        // Navigator.pushReplacementNamed(context, 'home_view');
      } else {
        AppAlerts.toast(message: value["message"]);
      }
    });

  }

  int generateRandomQr() {
    int temp;
    var random = Random();
    temp = random.nextInt(999999999);
    return temp;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _amountController.dispose();
    _unitController.dispose();
    _sizeController.dispose();
    _colorController.dispose();
    _explanationController.dispose();
    super.dispose();
  }

}