
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';
import 'custom_text.dart';

class DriverDetailsWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text Bus Driver Details Design
        Container(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            CustomText(text: 'Bus Driver Details', color: ColorTheme.red),
            Expanded(child: SizedBox()),
            Container(
              width: 30.ss,
                height: 30.ss,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorTheme.yellow
                ),
                child: IconButton(onPressed: (){},icon: SvgPicture.asset('assets/images/icons/arrow_icon.svg')))
          ]),
        ),

        SizedBox(height: 10.ss,),

             // Container Bus Driver Details Design
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: ColorTheme.red.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(8.ss)),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.ss),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 65.ss,
                  // height: 120.ss,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(35.ss)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.ss),
                    child: Column(
                      children: [
                        Text('BUS',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20.ss,fontWeight: FontWeight.w500,),),
                        Padding(
                          padding: EdgeInsets.only(top: 25,bottom: 10),
                          child: Container(
                            alignment: Alignment.center,
                            width: 45.ss,
                            height: 45.ss,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorTheme.yellow
                            ),
                              child: Text('10',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20.ss,fontWeight: FontWeight.w500,),)),
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.ss,right: 20.ss),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/icons/user_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                            SizedBox(width: 10.ss,),
                            RichText(text: TextSpan(text: 'Driver Name',children: [TextSpan(text: '\n'),TextSpan(text: 'BL Dhaka')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)),
                          ],
                        ),

                        SizedBox(height: 10.ss,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                            SizedBox(width: 10.ss,),
                            RichText(text: TextSpan(text: 'Contact Number',children: [TextSpan(text: '\n'),TextSpan(text: '8864020640')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)),
                          ],
                        ),

                        SizedBox(height: 10.ss,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/icons/bus_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                            SizedBox(width: 10.ss,),
                            RichText(text: TextSpan(text: 'Bus Number',children: [TextSpan(text: '\n'),TextSpan(text: 'M.P.09-7621A')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)),
                          ],
                        ),
                      ]),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

}