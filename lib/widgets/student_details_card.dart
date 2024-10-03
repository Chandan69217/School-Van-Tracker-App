import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';
import '../utilities/color_theme.dart';

class StudentDetailsCard extends StatelessWidget {

  final String childName;
  final String childImage;
  final String rollNo;
  final String className;
  final String DOB;
  final String sec;
  final String mob;
  final String studentID;


  StudentDetailsCard({
    required this.childImage,
    required this.className,
    required this.childName,
    required this.rollNo,
    required this.DOB,
    required this.sec,
    required this.mob,
    required this.studentID
});


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.ss)),
          color: ColorTheme.gray.withOpacity(0.2)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 12.ss),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [ Padding(padding: EdgeInsets.only(top: 14.ss),child: Text('Your Child Details',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12,color: ColorTheme.gray_dark.withOpacity(0.66),))),/* SizedBox(width: MediaQuery.of(context).size.width*0.435,),IconButton(onPressed: (){},icon: Icon(Icons.edit),style: ButtonStyle(iconColor: WidgetStatePropertyAll(ColorTheme.gray_dark.withOpacity(0.66)),iconSize: WidgetStatePropertyAll(20.ss))),*/],),

              SizedBox(height: 10.ss,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                        width: 90.ss,
                        height: 90.ss,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(childImage),
                                fit: BoxFit.fill),
                            border: Border.all(width: 2.ss,color: Colors.white.withOpacity(0.8)),
                            borderRadius: BorderRadius.all(Radius.circular(8.ss))
                        ),
                                              ),
                        SizedBox(height: 5.ss,),
                        Text(childName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w500)),
                      ]
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(text: 'Sec: ',children: [TextSpan(text: sec)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12))),
                        RichText(text: TextSpan(text: 'Class: ',children: [TextSpan(text: className)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12)),),
                        RichText(text: TextSpan(text: 'Roll No: ',children: [TextSpan(text: rollNo)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12))),
                        RichText(text: TextSpan(text: 'Mob: ',children: [TextSpan(text: mob)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12)),),
                        RichText(text: TextSpan(text: 'Date Of Birth: ',children: [TextSpan(text: DOB)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12)),),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ]
              ),

              SizedBox(height: 10.ss,),

            ],
          ),
            Padding(padding: EdgeInsets.only(right: 24.ss,top: 12.ss),
            child: Column(children: [Text('Student ID',style: Theme.of(context).textTheme.headlineMedium,),Text(studentID,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12),)],)),
          ]
        ),
      ),
    );
  }
}
