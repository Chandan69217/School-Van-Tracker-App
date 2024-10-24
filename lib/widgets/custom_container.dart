import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';



class CustomContainer extends StatelessWidget{
  final Widget child;
  final double topRight;
  final double topLeft;
  final double bottomLeft;
  final double bottomRight;
  final Color color;

  CustomContainer({
    required this.child,
    this.topRight = 50,
    this.topLeft = 50,
    this.bottomRight = 0,
    this.bottomLeft = 0,
    this.color = ColorTheme.yellow,
  });

  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.only(topRight: Radius.circular(topRight.ss),topLeft: Radius.circular(topLeft.ss),bottomRight: Radius.circular(bottomRight.ss),bottomLeft: Radius.circular(bottomLeft.ss))
      ),
    );
  }

}

