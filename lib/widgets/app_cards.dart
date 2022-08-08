import 'package:enterprise_resource_planning/design/app_colors.dart';
import 'package:enterprise_resource_planning/design/app_text.dart';
import 'package:flutter/material.dart';

class AppCards {
  static Widget taskCard({
    required Color color,
    required String header,
    required String task,
    required String date,
    required String userName,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 52, 105, 0.04),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 19,
                      width: 19,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      header,
                      style: AppText.contextSemiBold,
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              task,
              style: AppText.context,
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(39, 52, 105, 0.04),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
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
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(39, 52, 105, 0.04),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.person,
                        color: AppColors.lightBlack,
                        size: 20,
                      ),
                      Text(
                        userName,
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
        ),
      ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              side: BorderSide(color: Colors.transparent, width: 3),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: 90,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 20, color: AppColors.lightPrimary),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: AppColors.lightPrimary,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w600,
                          fontSize: 11),
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
