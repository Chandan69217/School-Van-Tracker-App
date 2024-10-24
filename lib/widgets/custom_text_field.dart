import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';

class CustomTextField extends  StatelessWidget{
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final IconButton? suffixIconButton;
  final String? labelText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLength;
  final FocusNode? focusNode;

  CustomTextField({
    this.controller,
    this.prefixIcon,
    this.suffixIconButton,
    this.labelText,
    this.obscureText = false,
    this.textInputAction,
    this.textInputType,
    this.textInputFormatter,
    this.maxLength,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      obscureText: obscureText,
      maxLength: maxLength,
      textInputAction: textInputAction,
      controller: controller,
      obscuringCharacter: "*",
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(19.ss),
          counterText: '',
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.ss)),),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.ss)),),
          labelStyle: TextStyle(fontFamily: 'Poppins',color: ColorTheme.gray_dark),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIconButton,
          labelText: labelText,
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorTheme.gray)
      ),
    );

  }
}
