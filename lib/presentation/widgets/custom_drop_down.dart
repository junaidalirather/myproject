import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/constant.dart';

import 'custom_label.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final List<String> options;
  final isDisableColored;
  final bool disableBorderColor;
  final String Function(String? val) validator;
  final ValueChanged<dynamic> onChanged;

  const CustomDropDown(
      {Key? key,
      this.isDisableColored = false,
      this.disableBorderColor = false,
      required this.label,
      required this.options,
      required this.validator,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisableColored,
      child: DropdownButtonFormField(
        isDense: true,
        itemHeight: 60,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        iconSize: 20,
        icon: disableBorderColor
            ? null
            : const Icon(
                Icons.arrow_drop_down_sharp,
                size: 20,
              ),
        hint: CustomLabel(
          title: "select".tr,
          fontSize: 14,
          textAlign: TextAlign.start,
        ),
        validator: validator,
        style: const TextStyle(
            fontFamily: Constants.poppins,
            fontSize: 12,
            color: AppColors.primaryColor),
        iconEnabledColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          border: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGray),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          fillColor:
              isDisableColored ? AppColors.lightGray : AppColors.whiteColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
        value: label,
        onChanged: (value) {
          onChanged(value);
        },
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return Container(
              // width: 25,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: Constants.poppins,
                        fontSize: 11,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            );
          }).toList();
        },
        isExpanded: true,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(
              height: 30,
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: Constants.poppins,
                    fontSize: 12,
                    color: AppColors.primaryColor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
