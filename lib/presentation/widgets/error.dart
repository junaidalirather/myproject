import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/widgets/error_widget.dart';

class ErrorView extends StatelessWidget {
  final Function()? buttonAction;
  const ErrorView({Key? key, this.buttonAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ErrorWidgetView(buttonAction: buttonAction),
    );
  }
}
