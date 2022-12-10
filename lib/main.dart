
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/config/app_colors.dart';
import 'app/config/constant.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:sizer/sizer.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.lightPurple,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));




      //if app is in debug mode
      runApp(MyApp());

}





class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            locale: const Locale('en', 'US'),

            fallbackLocale: const Locale('en', 'US'),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.LANDING_PAGE,
            getPages: Routes.getAllPages(),
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
          );
        }
    );

  }
}
