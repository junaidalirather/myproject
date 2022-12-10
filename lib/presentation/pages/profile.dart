import 'package:flutter/material.dart';

import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/widgets/coming_soon.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
