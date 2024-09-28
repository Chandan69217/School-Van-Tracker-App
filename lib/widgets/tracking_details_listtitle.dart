

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';

class TrackingDetailsListTitle extends StatelessWidget{
  
  final String title;
  final String driverName;
  final String busNo;
  final String imagePath;
  VoidCallback? onTrackPressed;
  VoidCallback? onCallPressed;

  TrackingDetailsListTitle({super.key, required this.title, required this.driverName, required this.busNo, required this.imagePath,this.onTrackPressed,this.onCallPressed});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        //color: ColorTheme.light.withOpacity(0.3),
        elevation: 2.ss,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
              height: 120,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 0,
                      child:CircleAvatar(
                        radius: 30.ss,
                        backgroundImage: AssetImage(imagePath),
                      )
                  ),
                  Expanded(
                      child:Padding(
                        padding: EdgeInsets.only(left: 10.ss,top:20.ss),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(title,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16,),),
                          RichText(
                              text: TextSpan(
                                text: 'Driver: ',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 11.ss,color: ColorTheme.gray_dark),
                                children: [
                                  TextSpan(text: driverName)
                                ],
                              )
                          ),

                          RichText(
                              text: TextSpan(
                                text: 'Bus No: ',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 11.ss,color: ColorTheme.gray_dark),
                                children: [
                                  TextSpan(text: busNo)
                                ],
                              )
                          ),
                        ],
                        ),
                      ) ),
                  Expanded(
                      flex: 0,
                      child: Column(
                        children: [
                          ElevatedButton.icon(onPressed: (){onTrackPressed!();}, label:Text('Track'),icon: SvgPicture.asset('assets/images/icons/location_icon.svg',width: 25,height: 25,color: ColorTheme.yellow,),style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(ColorTheme.yellow),elevation: WidgetStatePropertyAll(2.ss),shadowColor: WidgetStatePropertyAll(ColorTheme.yellow.withOpacity(0.7)),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.ss),side: BorderSide(width: 1.ss,color: ColorTheme.yellow.withOpacity(0.7))))),),
                          SizedBox(height: 15.ss,),
                          ElevatedButton.icon(onPressed: (){onCallPressed!();}, label:Text('Call  '),icon: SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 25,height: 25,color: ColorTheme.green,),style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(ColorTheme.green),elevation: WidgetStatePropertyAll(2.ss),shadowColor: WidgetStatePropertyAll(ColorTheme.green.withOpacity(0.7)),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.ss),side: BorderSide(width: 1.ss,color: ColorTheme.green.withOpacity(0.7)) ))),),
                        ],
                      )),
                ],
              )
          ),
        ),
      ),
    );
  }

}
