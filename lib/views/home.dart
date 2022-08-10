import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:enterprise_resource_planning/widgets/app_form.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DropdownMenuItem> items = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Image.asset("assets/images/Group 59.png"),
          ),
          leadingWidth: 160,
          actions: [
            const Icon(Iconsax.notification),
            const SizedBox(width: 12),
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                PopupMenuButton<int>(
                  tooltip: "Profil Menüsü",
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.person_28_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Profil", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(
                            FluentIcons.settings_24_regular,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Ayarlar", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 3,
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
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 4,
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
                    )
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
                    Text("Hoş geldin, ", style: AppText.contextSemiBold),
                    Text("Burak", style: AppText.context),
                  ],
                ),
                Text("5 Ağustos 2022, Cuma", style: AppText.contextSemiBold)
              ],
            ),
            const SizedBox(height: 16),
            Divider(thickness: 1, color: AppColors.lightPrimary.withOpacity(.16)),
            const SizedBox(height: 24),
            Text("Görevleriniz", style: AppText.titleSemiBold),
            const SizedBox(height: 16),
            AppCards.taskCard(
              color: AppColors.lightWarning,
              title: "header",
              task: "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.",
              date: "22/03/2022",
              fullName: "Burak Ünal",
            ),
            const SizedBox(height: 32),
            Text("İşlemler Menüsü", style: AppText.titleSemiBold),
            const SizedBox(height: 16),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              children: [
                AppCards.processCard(
                    icon: FluentIcons.add_square_24_regular,
                    text: "Hammadde Giriş",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("material_input_view");
                    }),
                AppCards.processCard(
                    icon: FluentIcons.subtract_square_24_regular,
                    text: "Hammadde Çıkış",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("material_output_view");
                    }),
                AppCards.processCard(
                    icon: FluentIcons.slide_text_24_regular,
                    text: "Detayları Gör",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("material_details_view");
                    }),
                AppCards.processCard(
                    icon: FluentIcons.slide_add_24_regular,
                    text: "Bitmiş Ürün Giriş",
                    onTap: () {}),
                AppCards.processCard(
                    icon: FluentIcons.vehicle_truck_bag_20_regular,
                    text: "Bitmiş Ürün Çıkış",
                    onTap: () {}),
                AppCards.processCard(
                    icon: FluentIcons.clipboard_error_24_regular,
                    text: "Hammadde Hata Bildir",
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("material_reporting_view");
                    }),
              ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(height: 32),
                Center(
                  child: Text(
                    "Copyright © Solvio Yazılım",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.4,
                      color: AppColors.lightPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}