import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import 'package:enterprise_resource_planning/utils/helpers.dart';
import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../storage/storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SecureStorage secureStorage = SecureStorage();
  List<DropdownMenuItem> items = [];

  Future<String> getFirstName() async {
    return await secureStorage.readSecureData('firstName');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> menuCards = [
      AppCards.processCard(
        icon: FluentIcons.add_square_24_regular,
        text: "Hammadde Giriş",
        onTap: () => Navigator.of(context).pushNamed("material_input_view"),
      ),
      AppCards.processCard(
        icon: FluentIcons.subtract_square_24_regular,
        text: "Hammadde Çıkış",
        onTap: () => Navigator.pushNamed(
          context,
          "barcode_scanner_view",
          arguments: {'screen': "material_output_view"},
        ),
      ),
      AppCards.processCard(
        icon: FluentIcons.slide_text_24_regular,
        text: "Detayları Gör",
        onTap: () => Navigator.pushNamed(
          context,
          "barcode_scanner_view",
          arguments: {'screen': "material_details_view"},
        ),
      ),
      AppCards.processCard(
        icon: FluentIcons.slide_add_24_regular,
        text: "Bitmiş Ürün Giriş",
        onTap: () => Navigator.of(context).pushNamed("product_input_view"),
      ),
      AppCards.processCard(
        icon: FluentIcons.vehicle_truck_bag_20_regular,
        text: "Bitmiş Ürün Çıkış",
        onTap: () => Navigator.pushNamed(
          context,
          "barcode_scanner_view",
          arguments: {'screen': "product_output_view"},
        ),
      ),
      AppCards.processCard(
        icon: FluentIcons.clipboard_error_24_regular,
        text: "Hammadde Hata Bildir",
        onTap: () => Navigator.pushNamed(
          context,
          "barcode_scanner_view",
          arguments: {'screen': "material_reporting_view"},
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset("assets/images/logo.png"),
          ),
          leadingWidth: 160,
          actions: [
            /*const Icon(Iconsax.notification),*/
            const SizedBox(width: 12),
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                PopupMenuButton<int>(
                  onSelected: (value) {
                    if(value == 1) Navigator.pushNamed(context, "help_view");
                  },
                  tooltip: "Profil Menüsü",
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context) => [
                    /*PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.chat_help_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Yardım", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),*/
                    PopupMenuItem(
                      onTap: logOut,
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.arrow_exit_20_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Çıkış Yap", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: AppColors.lightPrimary),
                  ),
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.transparent,
                  ),
                  offset: const Offset(0, 44),
                  color: AppColors.lightSecondary,
                  elevation: 0,
                ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Hoş geldin, ", style: AppText.labelSemiBold),
                    FutureBuilder(
                      future: getFirstName(),
                      builder: (context, snapshot) {
                        return Text(
                          Helpers.titleCase(snapshot.data.toString()),
                          style: AppText.label,
                        );
                      },
                    ),
                  ],
                ),
                Text(DateFormat.MMMMEEEEd("tr").format(DateTime.now()),
                    style: AppText.labelSemiBold)
              ],
            ),
            const SizedBox(height: 12),
            Divider(thickness: 1, color: AppColors.lightPrimary.withOpacity(.16)),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/hero-home.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.lightPrimary,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Baret Tak!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                          color: AppColors.lightSecondary,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Gözlük Kullan!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                          color: AppColors.lightSecondary,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Eldiven Giy!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                          color: AppColors.lightSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("İşlemler Menüsü", style: AppText.titleSemiBold),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 12,
              children: menuCards,
            ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await secureStorage.deleteAllSecureData().then((value) => {
          Navigator.pushReplacementNamed(context, 'login_view'),
        });
  }
}
