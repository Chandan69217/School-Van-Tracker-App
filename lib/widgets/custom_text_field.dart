


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';

class CustomTextField extends  StatelessWidget{

  final TextEditingController? controller;
  final Icon? prefixIcon;
  final IconButton? suffixIconButton;
  final String? hintText;
  final String obscureCharacter;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLength;



  CustomTextField({
    this.controller,
    this.prefixIcon,
    this.suffixIconButton,
    this.hintText,
    required this.obscureCharacter,
    required this.obscureText,
    this.textInputAction,
    this.textInputType,
    this.textInputFormatter,
    this.maxLength
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.ss,
        padding: EdgeInsets.only(top: 12.ss,bottom: 12.ss,right: 8.ss),
        decoration: BoxDecoration(
          border: Border.all(width: 1.ss),
          borderRadius: BorderRadius.all(Radius.circular(24.ss))
        ),
        child: Center(
          child: TextField(
            keyboardType: textInputType,
            inputFormatters: textInputFormatter,
            maxLength: maxLength,
            textInputAction: textInputAction,
            controller: controller,
            obscureText: obscureText,
            obscuringCharacter: obscureCharacter ,
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