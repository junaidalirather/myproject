import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/config/app_colors.dart';

import '../../app/config/constant.dart';
import '../../app/config/dimentions.dart';
import 'custom_label.dart';

class PrefixIconTextView extends StatelessWidget {
  final String icon, text;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final double fontSize;
  final Color textcolor;
  final double iconHeight, iconWidth;

  const PrefixIconTextView(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontSize = Dimensions.FONT_SIZE_SMALL,
      this.textcolor = AppColors.darkGray,
      this.fontFamily = Constants.poppins,
      this.textAlign = TextAlign.start,
      this.iconHeight = 14.0,
      this.iconWidth = 14.0,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: iconHeight,
          width: iconWidth,
        ),
        const SizedBox(
          width: 8,
        ),
        CustomLabel(
            title: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            textAlign: TextAlign.center,
            color: textcolor),
      ],
    );
  }
}
