import 'package:flutter/cupertino.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/config/dimentions.dart';
import '../../app/config/constant.dart';

class CustomRichText extends StatelessWidget {
  final String spanText1, spanText2;
  final FontWeight fontWeight1, fontWeight2;
  final FontStyle fontStyle1, fontStyle2;
  final Color color1, color2;
  final String fontFamily1, fontFamily2;
  final double fontSize1, fontSize2;

  const CustomRichText(
      {Key? key,
      required this.spanText1,
      required this.spanText2,
      this.color1 = AppColors.whiteColor,
      this.color2 = AppColors.whiteColor,
      this.fontWeight1 = FontWeight.w400,
      this.fontWeight2 = FontWeight.w400,
      this.fontStyle1 = FontStyle.normal,
      this.fontStyle2 = FontStyle.normal,
      this.fontFamily1 = Constants.poppins,
      this.fontFamily2 = Constants.poppins,
      this.fontSize1 = Dimensions.FONT_SIZE_SMALL,
      this.fontSize2 = Dimensions.FONT_SIZE_LARGE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: spanText1,
              style: TextStyle(
                fontFamily: fontFamily1,
                color: color1,
                fontSize: fontSize1,
                fontWeight: fontWeight1,
                fontStyle: fontStyle1,
              )),
          TextSpan(
            text: spanText2,
            style: TextStyle(
              fontFamily: fontFamily2,
              color: color2,
              fontSize: fontSize2,
              fontWeight: fontWeight2,
              fontStyle: fontStyle2,
            ),
          ),
        ],
      ),
    );
  }
}
