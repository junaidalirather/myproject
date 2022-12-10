import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/constant.dart';

import '../../app/config/dimentions.dart';
import '../../app/constants/images.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  final Color borderColor;
  final int maxLines;
  final double height, iconSize;
  final bool underLine;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final bool showLeadingIcon;
  final bool showTrailingIcon;
  final Function onTap;
  final bool isBorderVisibile;

  const CustomTextButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.leadingIcon = Icons.crop_square_sharp,
      this.trailingIcon = Icons.crop_square_sharp,
      this.iconSize = 0,
      this.fontWeight = FontWeight.normal,
      this.fontSize = Dimensions.FONT_SIZE_DEFAULT,
      this.color = AppColors.primaryColor,
      this.fontFamily = Constants.poppins,
      this.textAlign = TextAlign.left,
      this.maxLines = 1,
      this.height = 1.2,
      this.underLine = false,
      this.showLeadingIcon = false,
      this.showTrailingIcon = false,
      this.borderColor = AppColors.darkGray,
      this.isBorderVisibile = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        decoration: isBorderVisibile
            ? BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ))
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible: showLeadingIcon ? true : false,
                child: Icon(
                  leadingIcon,
                  color: color,
                )),
            Text(
              title,
              style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                  height: height,
                  decoration: !underLine
                      ? TextDecoration.none
                      : TextDecoration.underline),
              textAlign: textAlign,
              maxLines: maxLines,
            ),
            const SizedBox(
              width: 5,
            ),
            Visibility(
                visible: showTrailingIcon ? true : false,
                child: SvgPicture.asset(Images.rightArrow))
          ],
        ),
      ),
    );
  }
}
