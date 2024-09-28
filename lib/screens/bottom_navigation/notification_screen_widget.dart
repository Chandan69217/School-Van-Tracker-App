


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/notification_titlelist_widget.dart';
import 'package:sizing/sizing.dart';

import '../../animations/slide_left_down.dart';

class NotificationScreenWidget extends StatefulWidget{
  @override
  State<NotificationScreenWidget> createState() => _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  int lastPosition = -1;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.ss),
    child: Stack(
      alignment: Alignment.bottomRight,
      children:[ ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (buildContext,index){
          return  setAnimation(index);
          },
          itemCount: 100),
        Padding(padding: EdgeInsets.only(bottom: 24.ss,right: 24.ss),
        child: FloatingActionButton(
          onPressed: (){},
          child: SvgPicture.asset('assets/images/icons/delete_icon.svg',width: 25,height: 25,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.ss))),
          backgroundColor: ColorTheme.yellow.withOpacity(0.7),
          elevation: 12.ss,
        )),


        // Padding(padding: EdgeInsets.all(12.ss),
        // child: SizedBox(
        //   height: 50.ss,
        //     child: ElevatedButton.icon(onPressed: (){}, style: ButtonStyle(elevation: WidgetStatePropertyAll(12.ss),foregroundColor: WidgetStatePropertyAll(ColorTheme.gray_dark)),label: Text('Delete'),icon: SvgPicture.asset('assets/images/icons/delete_icon.svg',width: 25,height: 25,),)))
      ]
    ),
  );


  Widget setAnimation(int index){
    if(index>lastPosition){
      lastPosition = index;
      return SlideLeftDown(
        milliseconds: 500,
        child: NotificationTitlelistWidget(
          headline: 'Drop_Off',
          title: 'The bus has left school with your children.',
          subtitle: '12-02-2024 12:36PM',),
      );
    }else{
      return NotificationTitlelistWidget(
        headline: 'Drop_Off',
        title: 'The bus has left school with your children.',
        subtitle: '12-02-2024 12:36PM',);
    }
  }

}