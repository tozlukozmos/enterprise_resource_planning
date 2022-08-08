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
          actions: const [
            Icon(Icons.notifications_none),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 14,
            ),
            SizedBox(
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
                  task: "tasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktasktask",
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
