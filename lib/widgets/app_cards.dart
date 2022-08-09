import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import 'package:flutter/material.dart';

class AppCards {
  static Widget taskCard({
    required Color color,
    required String title,
    required String task,
    required String date,
    required String fullName,
  }) {
    return Container(
        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary.withOpacity(0.04),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundColor: color, radius: 9),
                    const SizedBox(width: 12),
                    Text(title, style: AppText.contextSemiBold)
                  ],
                ),
                PopupMenuButton<int>(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.published_with_changes_rounded,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("İşleme Al", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 2,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.alarm_add_rounded,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Alarm Ekle", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
                      value: 3,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline_rounded,
                            color: AppColors.lightPrimary,
                          ),
                          const SizedBox(width: 10),
                          Text("Hata Bildir", style: AppText.contextSemiBold),
                        ],
                      ),
                    ),
                  ],
                  shape: Border.all(color: AppColors.lightPrimary),
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: AppColors.lightBlack,
                  ),
                  offset: const Offset(0, 44),
                  color: AppColors.lightSecondary,
                  elevation: 0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(right: 16),
              child: Text(task, style: AppText.context),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: AppColors.lightBlack,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: AppColors.lightBlack,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  static Widget processCard({
    required IconData icon,
    required String text,
    required void Function() onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: AppColors.lightGrey,
        shadowColor: AppColors.lightBlack,
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: AppColors.lightGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: 90,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 24, color: AppColors.lightPrimary),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.lightPrimary,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}