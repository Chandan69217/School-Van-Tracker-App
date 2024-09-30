import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';

class CustomTextField extends  StatelessWidget{

  final TextEditingController? controller;
  final Icon? prefixIcon;
  final IconButton? suffixIconButton;
  final String? hintText;
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
    this.hintText,
    this.obscureText = false,
    this.textInputAction,
    this.textInputType,
    this.textInputFormatter,
    this.maxLength,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.ss,
        padding: EdgeInsets.only(top: 12.ss,bottom: 12.ss,right: 8.ss),
        decoration: BoxDecoration(
            border: Border.all(width: 1.ss,),
            borderRadius: BorderRadius.all(Radius.circular(24.ss))
        ),
        child: Center(
          child: TextField(
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
                counterText: '',
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIconButton,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorTheme.gray)
            ),
          ),
        )
    );
  }
}
