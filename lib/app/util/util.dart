// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/app/services/app_update.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';
import 'package:turno_customer_application/presentation/widgets/custom_label.dart';

import '../config/app_text_styles.dart';
import '../config/button_styles.dart';
import '../config/constant.dart';
import '../config/dimentions.dart';
import '../constants/images.dart';
import '../core/flavorsettings.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String convertDate(int? timeStamp) {
    int? val;
    if ((timeStamp ?? 0) > 0) {
      val = int.parse(timeStamp.toString().length == 10
          ? "${timeStamp}000"
          : timeStamp.toString());
    } else {
      val = 0;
    }
    DateTime date = DateTime.fromMillisecondsSinceEpoch(val);
    var format = DateFormat.yMMMMd();
    var dateString = format.format(date);
    return dateString;
  }

/*  static String mileageStatusText(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return 'danger'.tr;
    if (percent > 0.5 && percent < 0.8) return 'not_good'.tr;
    if (percent >= 0.8) return 'good'.tr;
    return '';
  }*/

  static String mileageStatusText(int percent) {
    if (percent == 2) return 'danger'.tr;
    if (percent == 1) return 'not_good'.tr;
    if (percent == 0) return 'good'.tr;
    return '';
  }

/*  static String mileageStatusIcon(int ideal, int actual) {
    double percent = ideal / actual;
    if (percent <= 0.5) return Images.icon_danger;
    if (percent > 0.5 && percent < 0.8) return Images.icon_not_good;
    if (percent >= 0.8) return Images.icon_good;
    return '';
  }*/

  static String mileageStatusIcon(int previousChargeMileageStatus) {
    if (previousChargeMileageStatus == 0) return Images.icon_good;
    if (previousChargeMileageStatus == 1) return Images.icon_not_good;
    if (previousChargeMileageStatus == 2) return Images.icon_danger;
    return '';
  }

  static String chargingStatusText(int charge) {
    if (charge == 2) return 'danger'.tr;
    if (charge == 1) return 'not_good'.tr;
    if (charge == 0) return 'good'.tr;

    return '';
  }

  static String chargingStatusIcon(int charge) {
    if (charge == 2) return Images.icon_danger;
    if (charge == 1) return Images.icon_not_good;
    if (charge == 0) Images.icon_good;
    return '';
  }

  static void showAlertDialog({
    required String title,
    required String message,
    List<Widget>? actions,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      actions: actions,
    );
  }

//REFERRED STATUS CHECK
  static String getReferredStatusById(int val) {
    if (val == -1) return 'rejected'.tr;
    if (val == 2) return 'completed'.tr;
    if (val == 1) return 'processing'.tr;
    if (val == 0) return 'pending'.tr;
    return '';
  }

  static String convertDatTimeFromMilliSeconds(int timestamp) {
    if (timestamp == 0) {
      return '';
    } else {
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      // 12 Hour format:
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  static void showBottomSheetWithMsg(String message) {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_DEFAULT,
              right: Dimensions.PADDING_SIZE_DEFAULT),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
              border: Border.all(
                color: AppColors.borderGray,
                width: 1,
              )),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'how_is_it_calculated'.tr,
                    style: lightBlackBold16,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Images.calculation),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      message,
                      style: lightBlackNormal14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )),
      isDismissible: true,
    );
  }

/* SHOW ALERT DIALOG FOR FORCE UPDATE */
  static showForceUpdateDialoug(
      BuildContext context, String msg, String okTitle,
      {required String title,
      Color backgroundColor = Colors.white,
      required Function() okHandler}) {
    return Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Visibility(
                  visible: (title != null) ? false : true,
                  child: Text(title, textAlign: TextAlign.center),
                ),
                content: Text(msg),
                actions: [
                  TextButton(onPressed: okHandler, child: Text(okTitle))
                ],
              );
            })
        : showDialog(
            context: context,
            useRootNavigator: false,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: _alertDialogHelp(context, msg, okTitle,
                    title: title,
                    backgroundColor: backgroundColor,
                    okHandler: okHandler),
              );
            },
          );
  }

  static Widget _alertDialogHelp(
      BuildContext context, String msg, String okTitle,
      {required String title,
      Color backgroundColor = Colors.white,
      required Function() okHandler}) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      title: CustomLabel(
        title: title,
        fontSize: Dimensions.FONT_SIZE_LARGE,
        textAlign: TextAlign.left,
        color: Colors.black,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: CustomLabel(
          title: msg,
          fontSize: Dimensions.FONT_SIZE_DEFAULT,
          textAlign: TextAlign.left,
          color: Colors.black,
        ),
      ),
      actions: [TextButton(onPressed: okHandler, child: Text(okTitle))],
    );
  }

  // show apk download progress
  static showProgressDialog(BuildContext context, String title) {
    var controller = Get.find<AppUpdate>();
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                content: SizedBox(
                  height: 220,
                  child: Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Obx(() => CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: controller.progress.value / 100,
                            center:
                                Text("${controller.progress.value.toInt()}%"),
                            progressColor: Colors.green,
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Obx(() {
                          return Visibility(
                              visible: controller.progress.value == 100,
                              child: TextButton(
                                  onPressed: () {
                                    Get.back();


                                  },
                                  child: Text(
                                    "Install".tr,
                                    style: const TextStyle(
                                        fontSize: Dimensions.FONT_SIZE_LARGE),
                                  )));
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //return true if the decimal value is greater than 0 else return false
  static bool checkIfTheDecimalIsGreaterThanZero(String string) {
    RegExp reg1 = RegExp(r'(^[1-9](?:\.[1-9])?$)');
    if (reg1.stringMatch(string) != null) {
      return true;
    }
    return false;
  }

  static String? generalDropDownValidator(String orgText) {
    final text = orgText.trimRight();
    if (text == null || text.isEmpty || text == 'SELECT' || text == 'Select') {
      return 'Please select any one option';
    }
    return null;
  }


  static referCongratulationsView() {
    Get.dialog(
        barrierDismissible: false,
        Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (_, constraints) => kIsWeb
                    ? Image.asset(
                        Images.refer_congrats,
                        scale: 2,
                        fit: BoxFit.fill,
                        width: constraints.maxWidth,
                      )
                    : Image.asset(
                        Images.refer_congrats,
                        scale: 3.2,
                        fit: BoxFit.fill,
                        width: constraints.maxWidth,
                      ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_XXLARGE,
              ),
              Text(
                "referral_submitted_txt".tr,
                style: greenBold20,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              kIsWeb
                  ? Image.asset(Images.refer_congrats_txt, scale: 2)
                  : Image.asset(Images.refer_congrats_txt, scale: 3.2),
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Text(
                  "refer_reward_txt".tr,
                  textAlign: TextAlign.center,
                  style: blackNormal12,
                ),
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Text(
                "refer_more_txt".tr,
                style: lightBlackBold16,
              ),
              const SizedBox(
                height: Dimensions.PADDING_SIZE_XLARGE,
              ),
              ElevatedButton(
                style:
                    btnStyle(width: Constants.deviceWidth * 0.7, height: 30.0),
                onPressed: () {
                  Get.back();

                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Text(
                  'done_txt'.tr,
                  style: whiteBold14,
                ), // <-- Text
              ),
            ],
          ),
        ));
  }

  static void showChartDialoug(VehicleDetailsController controller) {
    Get.dialog(

      Container(
        color: Colors.white,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                  NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: controller.tooltip,
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                        dataSource: controller.data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: 'Gold',
                        color: Color.fromRGBO(8, 142, 255, 1))
                  ]),
            ),
          ],
        ),
      ),
    );
  }




}

