import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import '../../app/config/constant.dart';
import '../../app/config/dimentions.dart';

class CustomLabel extends StatelessWidget {
  final String? title;
  final String subTitle;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  final int maxLines;
  final double height;
  final bool underLine, multiLine;

  const CustomLabel({
    Key? key,
    required this.title,
    this.fontWeight = FontWeight.normal,
    this.fontSize = Dimensions.FONT_SIZE_DEFAULT,
    this.color = AppColors.primaryColor,
    this.fontFamily = Constants.poppins,
    this.textAlign = TextAlign.start,
    this.maxLines = 2,
    this.height = 1.4,
    this.subTitle = '',
    this.underLine = false,
    this.multiLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title != null
                ? title!.contains('*')
                    ? title!.replaceAll("*", "")
                    : title
                : "",
            style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                overflow: TextOverflow.visible,
                height: height,
                decoration: !underLine
                    ? TextDecoration.none
                    : TextDecoration.underline),
          ),
          TextSpan(
            text: title != null
                ? title!.contains('*')
                    ? "*"
                    : ""
                : "",
            style: TextStyle(
                color: Colors.red,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                overflow: TextOverflow.visible,
                height: height,
                decoration: !underLine
                    ? TextDecoration.none
                    : TextDecoration.underline),
          ),
        ],
      ),
      textAlign: textAlign,
      overflow: TextOverflow.visible,
      maxLines: multiLine ? null : maxLines,
    );
  }
}
