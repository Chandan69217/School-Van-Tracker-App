
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
            Padding(
              padding: EdgeInsets.only(left: 160.ss),
              child: Container(
                  width: 30.ss,
                  height: 30.ss,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorTheme.yellow
                  ),
                  child: IconButton(onPressed: (){},icon: SvgPicture.asset('assets/images/icons/arrow_icon.svg'))),
            )
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
            padding: EdgeInsets.symmetric(vertical: 24.ss,horizontal: 24.ss),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: EdgeInsets.symmetric(horizontal: 20.ss),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/icons/user_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                          SizedBox(width: 20.ss,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Driver Name',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
                              Text('BL Dhaka',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),

                            ],
                          )
                        ],
                      ),

                      SizedBox(height: 10.ss,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                          SizedBox(width: 20.ss,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Number',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
                              Text('8864020240',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),

                            ],
                          )
                        ],
                      ),

                      SizedBox(height: 10.ss,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/icons/bus_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                          SizedBox(width: 20.ss,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bus Number',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
                              Text('M.P.09-7621A',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),

                            ],
                          )
                        ],
                      ),
                    ]),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

}