import 'package:flutter/material.dart';

import 'app_colors.dart';

ButtonStyle btnStyle({width,height}) => ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(width, height)),
    backgroundColor: MaterialStateProperty.all(AppColors.themeRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    )));
