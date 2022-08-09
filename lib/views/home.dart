import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import 'package:enterprise_resource_planning/widgets/app_cards.dart';
import 'package:flutter/material.dart';

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
          leading: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 59.png"))),
          ),
          actions: [
            const Icon(Icons.notifications_none),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage("soon")),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {},
                        value: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.lightPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profil",
                              style: AppText.contextSemiBold,
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        value: 2,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings,
                              color: AppColors.lightPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Ayarlar",
                              style: AppText.contextSemiBold,
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        value: 3,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.help_outline_sharp,
                              color: AppColors.lightPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Yardım",
                              style: AppText.contextSemiBold,
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        value: 4,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.exit_to_app_outlined,
                              color: AppColors.lightPrimary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Çıkış Yap",
                              style: AppText.contextSemiBold,
                            )
                          ],
                        ),
                      )
                    ],
                    shape: Border.all(color: AppColors.lightPrimary),
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.transparent,
                    ),
                    offset: const Offset(0, 36),
                    color: AppColors.lightSecondary,
                    elevation: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(24), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    "5 Ağustos 2022, Cuma",
                    style: AppText.contextSemiBold,
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 2,
                color: Color.fromRGBO(39, 52, 105, 0.16),
              ),
              const SizedBox(height: 20),
              Text(
                "Görevleriniz",
                style: AppText.headerSemiBold,
              ),
              const SizedBox(height: 10),
              AppCards.taskCard(
                  color: AppColors.lightWarning,
                  header: "header",
                  task: "task",
                  date: "22/03/2022",
                  userName: "Burak Ünal"),
              const SizedBox(height: 10),
              Text(
                "İşlemler Menüsü",
                style: AppText.headerSemiBold,
              ),
              const SizedBox(height: 10),
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 3,
                  children: [
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Hammadde Giriş",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("material_input_view");
                        }),
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Hammadde Çıkış",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("material_output_view");
                        }),
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Detayları Gör",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("material_details_view");
                        }),
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Bitmiş Ürün Giriş",
                        onTap: () {}),
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Bitmiş Ürün Çıkış",
                        onTap: () {}),
                    AppCards.processCard(
                        icon: Icons.add,
                        text: "Hatalı Hammadde Bildirimi",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("material_reporting_view");
                        })
                  ]),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                "Copyright © Solvio Yazılım",
                style: AppText.labelSemiBold,
              ))
            ],
          )
        ]),
      ),
    );
  }
}
