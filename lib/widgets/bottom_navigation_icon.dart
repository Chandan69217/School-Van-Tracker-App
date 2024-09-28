

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';

class BottomNavigationIcon extends StatelessWidget{

  final Color? iconColor;
  final String iconPath;
  final double opacity;

  BottomNavigationIcon({
    this.iconColor,
    required this.iconPath,
    required this.opacity,
});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
        opacity: opacity,
        child: Container(
        height: 33.ss,
        width: 48.ss,
        decoration: BoxDecoration(
        color: ColorTheme.yellow.withOpacity(0.2),
        borderRadius: BorderRadius.circular(18),
        ),
        ),
      ),

        Center(
          child: SvgPicture.asset(
            iconPath,
            color: iconColor,
            width: 30,
            height:30,
          ),
        )
      ]
    );
  }

}