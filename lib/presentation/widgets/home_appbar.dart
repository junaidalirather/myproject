// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:turno_customer_application/app/config/app_colors.dart';

import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

class BaseAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 10,
            ),
            CustomLabel(
              title: "welcome",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
      backgroundColor: AppColors.lightPurple,
    );
  }
}
