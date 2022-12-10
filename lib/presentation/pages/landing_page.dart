import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';
import 'package:turno_customer_application/presentation/pages/profile.dart';
import 'package:turno_customer_application/presentation/pages/snap_shot/snapshot.dart';
import 'package:turno_customer_application/presentation/pages/vehicle_catalouge.dart';
import '../../app/config/constant.dart';
import '../../app/config/dimentions.dart';
import '../../app/constants/images.dart';
import '../controllers/landing_page/landing_page_controller.dart';
import '../controllers/vehicle_controller/vehicle_details_controller.dart';
import 'apply_new_loan.dart';


class LandingPage extends GetView<LandingPageController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants.deviceHeight = MediaQuery.of(context).size.height;
    Constants.deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: SafeArea(
        child: Obx(() => _getAllClasses()),
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.all(
                Radius.circular(12)
            ),
            color: Colors.grey,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: Dimensions.FONT_SIZE_DEFAULT,
            unselectedFontSize: Dimensions.FONT_SIZE_SMALL,
            onTap: landingPageController.setSelectedIndex,
            currentIndex: landingPageController.selectedIndex.value,
            backgroundColor:  AppColors.darkBlue,
            selectedItemColor: AppColors.whiteColor,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
            unselectedIconTheme: const IconThemeData(
              color: AppColors.darkGray,
            ),
            unselectedItemColor: AppColors.darkGray,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle,color: Colors.grey,),
                label: 'SnapShot',
                activeIcon: Icon(Icons.account_circle,color: Colors.white,)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_sharp,color: Colors.grey,),
                  label: 'Hodlings',
                  activeIcon: Icon(Icons.account_balance_sharp,color: Colors.white,)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money,color: Colors.grey,),
                  label: 'Investment',
                  activeIcon: Icon(Icons.money,color: Colors.white,)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined,color: Colors.grey,),
                  label: 'Investment',
                  activeIcon: Icon(Icons.account_circle_outlined,color: Colors.white,)
              ),

            ],
          ),
        )));
  }

  _getAllClasses() {
    switch (controller.selectedIndex.value) {
      case 0:
        Get.put(VehicleDetailsController());
        return const SnapShot();
      case 1:
        return const Holdings();
      case 2:
        return const Investment();
      case 3:
        return const Profile();
    }
  }
}
