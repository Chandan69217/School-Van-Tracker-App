import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';


class CustomText extends StatelessWidget{
  final String? text;
  final Color? color;

  CustomText({
    required this.text,
    required this.color,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 35.ss,
            height: 35.ss,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color!.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.ss),
              child: Text(text!,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:color!.withOpacity(0.7),),)),
          Padding(
            padding: EdgeInsets.only(left: 10.ss,top: 20.ss),
            child: Container(height: 2.ss,width: 27.ss,
            decoration: BoxDecoration(
              color: color!.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(8.ss)),
              )
            ),),
        ],
      )
    );
  }
  
}



