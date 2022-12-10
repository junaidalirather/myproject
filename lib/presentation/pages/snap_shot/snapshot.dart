import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:gradient_colored_slider/gradient_colored_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:turno_customer_application/app/config/constant.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/constants/images.dart';

import 'package:flutter/foundation.dart';

import '../../../app/util/util.dart';

class SnapShot extends GetView<VehicleDetailsController> {
  const SnapShot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.darkBlue, body: renderUI());
  }

  renderUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: Constants.deviceHeight * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.mask_group),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  ProfileBar(),
                  NetWorthView(),
                ],
              )),
          InkWell(
            child: LiveMarketIndex(),
            onTap: () {
              Utils.showChartDialoug(controller);
            },
          ),
          InvestmentOverView(),
          PersonalInvestment(controller),
          InkWell(
            child: DataSecurityCard(),
            onTap: () {
              Utils.showChartDialoug(controller);
            },
          ),
        ],
      ),
    );
  }
}

class DataSecurityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return // Rectangle 135
        Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1),
          boxShadow: [
            BoxShadow(
                color: const Color(0x40000000),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          gradient: LinearGradient(
              begin: Alignment(0.35999995919759975, -1.2109460989506715e-8),
              end: Alignment(0.5919998994984825, 1.0550001861363798),
              colors: [const Color(0x00ffffff), const Color(0xa6ffffff)])),
      child: Row(
        children: [
          Image.asset(
            Images.shield,
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 5,
          ),
          // Your data is 100% secure. we don’t share your information with any third party
          Expanded(
            flex: 2,
            child: Text(
                "Your data is 100% secure. we don’t share your information with any third party",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    fontStyle: FontStyle.normal,
                    fontSize: 10.0),
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }
}

class PersonalInvestment extends StatelessWidget {
  bool status = false;
  VehicleDetailsController vehicleDetailsController;

  PersonalInvestment(this.vehicleDetailsController);

  @override
  Widget build(BuildContext context) {
    return // Rectangle 131
        Container(
      width: Constants.deviceWidth,
      margin: EdgeInsets.all(15.0),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1),
        boxShadow: const [
          BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0)
        ],
        gradient: const LinearGradient(
            begin: Alignment(0.35999995919759975, -1.2109460989506715e-8),
            end: Alignment(0.5919998994984825, 1.0550001861363798),
            colors: [Color(0x00ffffff), Color(0xa6ffffff)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Explore Personalised investments
          const Text("Explore Personalised investments",
              style: TextStyle(
                  color: Color(0xfff5d480),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Inter",
                  fontStyle: FontStyle.normal,
                  fontSize: 9.0),
              textAlign: TextAlign.left),
          Spacer(),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(4.333333492279053)),
                border: Border.all(width: 0.5),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x40020a22),
                      offset: Offset(0, 6.066666603088379),
                      blurRadius: 6.933333396911621,
                      spreadRadius: 0)
                ],
                gradient: LinearGradient(
                    begin: Alignment(0.982935172077235, 0.9999999341092276),
                    end: Alignment(0.02047774828692006, -6.83287679770217e-8),
                    colors: [
                      const Color(0xb2ffffff),
                      const Color(0x47ffffff)
                    ])),
            child: Row(
              children: [
                // Calibrated risk profile
                const SizedBox(
                  width: 10,
                ),
                const Text("Calibrated risk profile",
                    style: TextStyle(
                        color: Color(0xffebebeb),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.left),
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  Images.info_icon,
                  width: 15,
                  height: 15,
                )
              ],
            ),
          ),
          Spacer(),
          // Rectangle 137
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Recommended
                const Text("Recommended",
                    style: TextStyle(
                        color: Color(0xfff5cd7f),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.left),
                Obx(() {
                  return vehicleDetailsController.status.value
                      ? FlutterSwitch(
                          width: 40,
                          height: 20,
                          valueFontSize: 25.0,
                          toggleSize: 20.0,
                          value: vehicleDetailsController.status.value,
                          padding: 8.0,
                          toggleColor: Color(0xfff5cd7f),
                          inactiveColor: Color(0xff2c314a),
                          showOnOff: true,
                          onToggle: (val) {
                            vehicleDetailsController.status.value = val;
                          },
                        )
                      : FlutterSwitch(
                          width: 40,
                          height: 20,
                          valueFontSize: 25.0,
                          toggleSize: 20.0,
                          value: vehicleDetailsController.status.value,
                          padding: 8.0,
                          toggleColor: Color(0xfff5cd7f),
                          inactiveColor: Color(0xff2c314a),
                          showOnOff: true,
                          onToggle: (val) {
                            vehicleDetailsController.status.value = val;
                          },
                        );
                }),

                // Set manually
                Text("Set manually",
                    style: const TextStyle(
                        color: const Color(0x87ffffff),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        fontStyle: FontStyle.normal,
                        fontSize: 8.0),
                    textAlign: TextAlign.left),
                // Rectangle 13
                Container(
                  width: 73.25,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0)
                      ],
                      color: const Color(0xff4f568c)),
                  child: // Re-Callibrate
                      Center(
                    child: Text("Re-Callibrate",
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            fontStyle: FontStyle.normal,
                            fontSize: 8.0),
                        textAlign: TextAlign.left),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          // Rectangle 131
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                // Rectangle 34
                Container(
                  width: 55,
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: const Color(0xffafc13d)),
                  child: const Center(
                    child: // Defensive
                        Text("Defensive",
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontStyle: FontStyle.normal,
                                fontSize: 10.0),
                            textAlign: TextAlign.left),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Obx(() => vehicleDetailsController.range.value > 0
                      ? GradientColoredSlider(
                          value: vehicleDetailsController.range.value,
                          barSpace: 0.0,
                          barWidth: 0.1,
                          gradientColors: const [
                            Color(0xFFE84E4E),
                            Color(0xFFF3C03B),
                            Color(0xFF43EA7C),
                            Color(0xFF43EA7C),
                          ],
                          onChanged: (double value) {
                            vehicleDetailsController.range.value = value;
                          },
                        )
                      : GradientColoredSlider(
                          value: vehicleDetailsController.range.value,
                          barSpace: 0.0,
                          barWidth: 0.1,
                          gradientColors: const [
                            Color(0xFFE84E4E),
                            Color(0xFFF3C03B),
                            Color(0xFF43EA7C),
                            Color(0xFF43EA7C),
                          ],
                          onChanged: (double value) {
                            vehicleDetailsController.range.value = value;
                          },
                        )),
                )
              ],
            ),
          ),
          Spacer(),
          // Rectangle 10
        ],
      ),
    );
  }
}

class InvestmentOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 15.0, right: 15.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1),
        boxShadow: const [
          BoxShadow(
              color: const Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0)
        ],
        gradient: const LinearGradient(
            begin: Alignment(0.35999995919759975, -1.2109460989506715e-8),
            end: Alignment(0.5919998994984825, 1.0550001861363798),
            colors: [Color(0x00ffffff), const Color(0xa6ffffff)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // investment overview
                    const Text("investment overview",
                        style: TextStyle(
                            color: Color(0xfff5d580),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontStyle: FontStyle.normal,
                            fontSize: 8.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      height: 4,
                    ),
                    // 86 Lakhs
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: Color(0xffc6e6ff),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0),
                              text: "86 L"),
                          TextSpan(
                              style: TextStyle(
                                  color: Color(0xffc6e6ff),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0),
                              text: "Lakhs")
                        ])),
                        // 45K | 2.3%
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("45K | 2.3%",
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontStyle: FontStyle.normal,
                                fontSize: 8.0),
                            textAlign: TextAlign.left)
                      ],
                    )
                  ],
                ),
                Spacer(),
                // Frame 3493
// Vector
                Container(
                  width: 50,
                  height: 30,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xff3d4260)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // View
                      Text("View ",
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 9.0),
                          textAlign: TextAlign.left),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Rectangle 59
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x40020a22),
                        offset: Offset(0, 6.066666603088379),
                        blurRadius: 6.933333396911621,
                        spreadRadius: 0)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment(0.982935172077235, 0.9999999341092276),
                      end: Alignment(0.02047774828692006, -6.83287679770217e-8),
                      colors: [
                        const Color(0xb2ffffff),
                        const Color(0x47ffffff)
                      ])),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.gold_icon,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      Text("Gold",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      // 14.56Lakhs
                      SizedBox(
                        height: 5,
                      ),
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.mutual_fund_icon,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      Text("Mutual Fund",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      // 14.56Lakhs
                      SizedBox(
                        height: 5,
                      ),
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.smart_deposit,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      Text("Smart Deposit",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      // 14.56Lakhs
                      SizedBox(
                        height: 5,
                      ),
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.epf_icon,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      Text("Epf",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      // 14.56Lakhs
                      SizedBox(
                        height: 5,
                      ),
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.fixed_deposit,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      const Text("Fixed Deposit",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      // 14.56Lakhs
                      SizedBox(
                        height: 5,
                      ),
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.nsp_icon,
                        height: 50,
                        width: 50,
                      ),
                      // Gold
                      Text("Nps",
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 5,
                      ),
                      // 14.56Lakhs
                      Text("14.56Lakhs",
                          style: const TextStyle(
                              color: const Color(0xdbc7e3fc),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 8.3),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LiveMarketIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 0.5, color: Colors.grey),
          gradient: const LinearGradient(
              begin: Alignment(0.019354857729778185, 0.062499852541344936),
              end: Alignment(0.999999984744337, 0.9999998745405012),
              colors: [const Color(0x1fffffff), const Color(0x1fffffff)])),
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live Market index
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Live Market index",
                  style: TextStyle(
                      color: Color(0xfff5d580),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                      fontSize: 8.0),
                  textAlign: TextAlign.left),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: SizedBox(
                height: 90,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(width: 0.5),
                            gradient: const LinearGradient(
                                begin: Alignment(
                                    0.019354857729778185, 0.062499852541344936),
                                end: Alignment(
                                    0.999999984744337, 0.9999998745405012),
                                colors: [
                                  const Color(0x1fffffff),
                                  const Color(0x1fffffff)
                                ])),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(width: 0.5),
                                          color: Colors.lightBlueAccent),
                                      padding: EdgeInsets.all(5.0),
                                      child: const Text("BSE sensex",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Inter",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 6.9),
                                          textAlign: TextAlign.left),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Image.asset(
                                      Images.arrow_up,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("54,040.06",
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 9.5),
                                    textAlign: TextAlign.left),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("14 Jul 2022 3.30 PM",
                                    style: TextStyle(
                                        color: Color(0xbfffffff),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 7.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: const [
                                SizedBox(
                                  height: 5,
                                ),
                                Text("2.36%",
                                    style: TextStyle(
                                        color: Color(0xffd9d9d9),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 9.5),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  height: 14,
                                ),
                                Text("263.15",
                                    style: TextStyle(
                                        color: Color(0xff18cb3f),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 8.7),
                                    textAlign: TextAlign.left),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetWorthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(width: 0.5),
          gradient: const LinearGradient(
              begin: Alignment(0.019354857729778185, 0.062499852541344936),
              end: Alignment(0.999999984744337, 0.9999998745405012),
              colors: [const Color(0x1fffffff), const Color(0x1fffffff)])),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 20.0, top: 20.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Insight of",
                          style: TextStyle(
                              color: Color(0xfff3d19e),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 10.3),
                          textAlign: TextAlign.left),
                      // Your Networth
                      Text("Your Networth",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text("₹ 34.87",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0),
                      textAlign: TextAlign.right),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      // Lakhs
                      Text("Lakhs",
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 7.7),
                          textAlign: TextAlign.left),
                      Text("2.36%",
                          style: TextStyle(
                              color: Color(0xff18cb3f),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 7.9),
                          textAlign: TextAlign.right)
                    ],
                  ),
                )
              ],
            ),
          ),
// Vector 4
          Container(
              width: 265.465,
              height: 1,
              decoration: const BoxDecoration(color: Color(0x8ca0a4d0))),

          Container(
            margin: const EdgeInsets.only(
                left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                // Track your networth in real time
                const Expanded(
                  flex: 3,
                  child: Text("Track your networth in real time",
                      style: TextStyle(
                          color: Color(0xffebebeb),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontStyle: FontStyle.normal,
                          fontSize: 8.0),
                      textAlign: TextAlign.left),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Asset
                      Text("Asset",
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 9.0),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 4,
                      ),
                      Text("₹ 34.87 L",
                          style: TextStyle(
                              color: Color(0xfff5cd7f),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Liablities
                      Text("Liablities",
                          style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 9.0),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 4,
                      ),
                      // NA
                      Text("NA",
                          style: TextStyle(
                              color: Color(0xfffda0a0),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0),
                          textAlign: TextAlign.left)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 35.0, left: 35.0, right: 35.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.profile_icon,
            width: 45,
            height: 45,
          ),
          SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Hey
              Text("Hey ",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.right),
              // Good Morning!
              Text("Good Morning!",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  textAlign: TextAlign.left)
            ],
          ),
          Spacer(),
          Image.asset(
            Images.cart_icon,
            width: 45,
            height: 45,
          )
        ],
      ),
    );
  }
}
