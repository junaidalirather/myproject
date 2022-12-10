import 'package:flutter/material.dart';
import 'package:turno_customer_application/app/config/app_colors.dart';

class CustomTextField extends StatelessWidget {
  @required
  final TextEditingController textController;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final IconData? iconData;
  final Function? onTapAction;
  final TextInputType? keyboardInputType;
  final bool isObscureText;
  final bool isEnabled;
  final bool? isReadOnly;
  final bool? isDisableColored;
  final String? Function(String? val)? validator;
  final ValueChanged<String>? onChanged;
  final Function? onSaved;
  final TextStyle? errorStyle;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? prefixText;

  const CustomTextField({
    Key? key,
    required this.textController,
    this.labelText,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.focusNode,
    this.iconData,
    this.onTapAction,
    this.isObscureText = false,
    this.isEnabled = true,
    this.isReadOnly,
    this.validator,
    this.isDisableColored = false,
    this.onSaved,
    this.errorText,
    this.keyboardInputType,
    this.errorStyle,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.labelStyle,
    this.hintStyle,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autofocus: true,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardInputType,
        controller: textController,
        focusNode: focusNode,
        obscureText: isObscureText,
        enabled: isEnabled,
        onTap: () {
          onTapAction;
        },
        decoration: InputDecoration(
          prefixText: prefixText,
          errorMaxLines: 2,
          errorText: errorText,
          errorStyle: errorStyle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          border: border,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: AppColors.subTextColor,
            ),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.placeholderColor,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: hintStyle,
        ),
        validator: validator,
      ),
    );
  }
}
