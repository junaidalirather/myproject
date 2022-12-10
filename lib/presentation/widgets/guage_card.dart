// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:turno_customer_application/app/config/constant.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/app_text_styles.dart';
import '../../app/config/dimentions.dart';
import 'custom_label.dart';

class GuageCardView extends StatelessWidget {
  String header, startRange, endRange, description, centreValue, centreText;
  int? actualBuyback = 0;
  int? idealBuyback = 0;
  int? idealMileage = 0;
  int? actualMileage = 0;
  bool isSingleColour;
  final Function() buttonAction;

  GuageCardView(
      {Key? key,
      required this.actualBuyback,
      required this.idealBuyback,
      required this.actualMileage,
      required this.idealMileage,
      required this.header,
      required this.startRange,
      required this.centreText,
      required this.centreValue,
      required this.description,
      required this.endRange,
      required this.isSingleColour,
      required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: constraints.maxWidth/0.35.w, // WORKAROUND
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      canScaleToFit: true,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 180,
                      endAngle: 360,
                      radiusFactor: 0.9,
                      axisLineStyle: const AxisLineStyle(
                          thickness: 0.1,
                          thicknessUnit: GaugeSizeUnit.factor),
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            verticalAlignment: GaugeAlignment.far,
                            angle: 90,
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(centreValue, style: lightBlackBold14),
                                Text(centreText, style: darkGrayNormal10)
                              ],
                            )),
                        GaugeAnnotation(
                          angle: 180,
                          positionFactor: 1,
                          widget: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Text(startRange,
                                  style: lightBlackNormal12)),
                        ),
                        GaugeAnnotation(
                          angle: 360,
                          positionFactor: isSingleColour ? 1 : 0.8,
                          widget: Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Text(endRange,
                                  textAlign: TextAlign.left,
                                  style: lightBlackNormal12)),
                        ),
                      ],
                      pointers: <GaugePointer>[
                        isSingleColour
                            ? RangePointer(
                                value: (actualBuyback! / idealBuyback!) * 100,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 1200,
                                sizeUnit: GaugeSizeUnit.factor,
                                gradient: const SweepGradient(colors: <Color>[
                                  AppColors.themeRed
                                ], stops: <double>[
                                  1,
                                ]),
                                color: const Color(0xFF00A8B5),
                                width: 0.1)
                            : RangePointer(
                                value: (actualMileage! / idealMileage!) * 100,
                                cornerStyle: CornerStyle.bothCurve,
                                enableAnimation: true,
                                animationDuration: 1200,
                                sizeUnit: GaugeSizeUnit.factor,
                                gradient: const SweepGradient(colors: <Color>[
                                  Color(0xFFE84E4E),
                                  Color(0xFFF3C03B),
                                  Color(0xFF43EA7C),
                                  Color(0xFF43EA7C),
                                ], stops: <double>[
                                  0.25,
                                  0.5,
                                  0.75,
                                  1
                                ]),
                                color: const Color(0xFF00A8B5),
                                width: 0.1),
                        WidgetPointer(
                            value: isSingleColour
                                ? (actualBuyback! / idealBuyback!) * 100
                                : (actualMileage! / idealMileage!) * 100,
                            child: Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: const Icon(Icons.arrow_drop_down,
                                    color: AppColors.primaryColor)))
                      ]),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Center(
            child: CustomLabel(
              title: header,
              fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Dimensions.RADIUS_DEFAULT,
                backgroundColor: AppColors.xlightPurple,
                child: Icon(
                  Icons.question_mark,
                  size: Constants.deviceHeight * 0.02,
                  color: AppColors.redBg,
                ),
              ),
              SizedBox(
                width: Constants.deviceWidth * 0.02,
              ),
              CustomLabel(
                  title: "how_is_it_calculated".tr,
                  textAlign: TextAlign.center,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
                  maxLines: 2,
                  color: AppColors.themeRed,
                  fontWeight: FontWeight.w500),
            ],
          ),

          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          CustomLabel(
              title: description,
              textAlign: TextAlign.center,
              fontSize: Dimensions.FONT_SIZE_DEFAULT.sp,
              maxLines: 5,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
        ],
      ),
    );
  }
}
