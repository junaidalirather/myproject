import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonAction,
    required this.child,
    this.width,
    this.isActive = true,
    this.height = 44.0,
    this.fontSize = 18,
    this.bgColor,
    this.paddingWidth = 10.0,
    this.languageCode = false,
  }) : super(key: key);

  final Widget? child;
  final Function() buttonAction;
  final double fontSize;
  final bool isActive;
  final double? width;
  final double height;
  final bool isOutlined = false;
  final bool isRounded = true;
  final Color? bgColor;
  final double paddingWidth;
  final bool languageCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.redBg,
          width: 1,
        ),
        gradient:const LinearGradient(colors: [Color.fromRGBO(232, 52, 94, 0.1), Color.fromRGBO(232, 52, 94, 0.1)]), borderRadius: BorderRadius.circular(Dimensions.RADIUS_XXLARGE)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.redBg,
        ),
        ),
        onPressed: buttonAction,
        child: child,
      ),
    );
  }
}
