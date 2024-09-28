import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/main.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';



class CustomContainer extends StatelessWidget{
  final Widget child;

  CustomContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorTheme.yellow.withOpacity(0.7),
        borderRadius: BorderRadius.only(topRight: Radius.circular(50.ss),topLeft: Radius.circular(50.ss))
      ),
    );
  }
}