


import 'package:flutter/material.dart';
import 'package:school_route/utilities/call_back_functions.dart';
import 'package:sizing/sizing.dart';


class DialogBox{

  callBackFunction? onPressedOk;
  callBackFunction? onPressedCancel;
  final String title;
  final String content;
  final IconData? icon;
  final double hide;
  final BuildContext context;

  DialogBox({
    required this.context,
    this.title='',
    this.content='',
    this.onPressedOk,
    this.onPressedCancel,
    this.icon,
    this.hide = 1,
  }){
    showDialogBox(context);
  }

  void showDialogBox(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Row(
              children: [
                Icon(icon),
                SizedBox(width: 8.ss,),
                Text(title),
              ],
            ),
            content: Text(content),
            actions: [
              Opacity(opacity: hide,
              child: TextButton(onPressed: (){onPressedCancel!(context);}, child: Text('Cancel'))),
             TextButton(onPressed: (){onPressedOk!(context);}, child: Text('Ok')),
            ],

          );
        }
    );
  }
}


