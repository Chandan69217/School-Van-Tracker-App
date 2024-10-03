


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';

class ProfilePic extends StatelessWidget{
  final Color? borderColor;
  final String imagePath;


  ProfilePic({
    this.borderColor,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        children: [Container(
          width: 143.ss,
          height: 143.ss,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70.ss)),
              color: borderColor
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 70.ss,
          ),
        ),

          Padding(
            padding: EdgeInsets.only(bottom: 5.ss),
            child: SizedBox(
              width: 40.ss,
              height: 40.ss,
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_outlined,color: ColorTheme.yellow.withOpacity(0.7),)),
            ),
          )
        ]
    );


  }

}
