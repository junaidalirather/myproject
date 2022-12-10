// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/constant.dart';

import '../../app/constants/images.dart';
import 'custom_button.dart';
import 'custom_label.dart';

class ComingSoon extends StatelessWidget {
  bool showButton;
  ComingSoon({Key? key, required this.showButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.whiteColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: Constants.deviceWidth,
                height: Constants.deviceHeight * 0.6,
                child: Image.asset(Images.koshex,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: Constants.deviceHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomLabel(
                  title: 'coming_soon'.tr,
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Constants.deviceHeight * 0.05,
              ),
              if (showButton == true)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    width: Constants.deviceWidth * 0.95,
                    buttonAction: () {
                      Get.back();
                    },
                    child: CustomLabel(
                      title: 'back'.tr,
                      color: AppColors.redBg,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
