import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/widgets/coming_soon.dart';


class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,

        body: SingleChildScrollView(
          child: ComingSoon(
                  showButton: true,
                ),
        ));
  }
}
