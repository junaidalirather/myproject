import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import '../../../app/config/constant.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class LandingPageController extends GetxController {
  var selectedIndex = 0.obs;

  //change the index of bottom nav based on user interaction
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
