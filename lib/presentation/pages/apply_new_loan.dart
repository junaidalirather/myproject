import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../app/config/app_colors.dart';
import '../widgets/coming_soon.dart';

class Holdings extends StatelessWidget {
  const Holdings({Key? key}) : super(key: key);

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
