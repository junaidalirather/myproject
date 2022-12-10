import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';
import 'dimentions.dart';

InputDecoration textBoxBorderDecoration(text) => InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGray),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    hintText: text,
    hintStyle: txtHintNormal14);

BoxDecoration defaultBoxDecoration(
        {double radius = Dimensions.RADIUS_DEFAULT,
        Color color = AppColors.bgColor,
        Color borderColor = AppColors.borderGray}) =>
    BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor,
          width: 1,
        ));

BoxDecoration topLeftRoundCornerBoxDecoration(
        {double radius = Dimensions.RADIUS_DEFAULT,
        Color color = AppColors.bgColor,
        Color borderColor = AppColors.borderGray}) =>
    BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
      ),
      border: Border.all(
        width: 1,
        color: borderColor,
        style: BorderStyle.solid,
      ),
    );

BoxDecoration topLeftandRightRoundCornerBoxDecoration(
    {double radius = Dimensions.RADIUS_DEFAULT,
      Color color = AppColors.bgColor,
      Color borderColor = AppColors.borderGray}) =>
    BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      ),
      border: Border.all(
        width: 1,
        color: borderColor,
        style: BorderStyle.solid,
      ),
    );

EdgeInsets defaultContainerPadding() => const EdgeInsets.only(
    top: Dimensions.PADDING_SIZE_DEFAULT,
    bottom: Dimensions.PADDING_SIZE_DEFAULT,
    left: Dimensions.PADDING_SIZE_DEFAULT,
    right: Dimensions.PADDING_SIZE_DEFAULT);

BoxDecoration buttonDefaultBg(
        {Color color1 = AppColors.whiteColor,
        Color color2 = AppColors.whiteColor}) =>
    BoxDecoration(
        gradient: LinearGradient(
      colors: [color1, color2],
    ));
