import 'package:flutter/material.dart';
import 'package:perumahan_bew/app/themes/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.controller,
    this.maxLines = 1,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int maxLines;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: dangerColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: dangerColor,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(color: fontColor),
      ),
      validator: validator,
    );
  }
}
