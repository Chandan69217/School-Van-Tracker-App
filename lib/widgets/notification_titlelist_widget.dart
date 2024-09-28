

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';

class NotificationTitlelistWidget extends StatelessWidget {

  final String headline;
  final String title;
  final String subtitle;

  NotificationTitlelistWidget({
    required this.headline,
    required this.title,
    required this.subtitle,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5.ss,
        shadowColor: ColorTheme.yellow.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(12.ss),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headline,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14.ss),),
              SizedBox(height: 2.ss,),
              Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),),
              Text(subtitle,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorTheme.gray.withOpacity(0.8)),)
            ],
          ),
        ),
      ),
    );
  }
}
