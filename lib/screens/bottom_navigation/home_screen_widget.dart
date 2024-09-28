
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/driver_details_widget.dart';
import 'package:school_route/widgets/school_details_widget.dart';
import 'package:sizing/sizing.dart';

class HomeScreenWidget extends StatefulWidget{
  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 24.ss,right: 24.ss,top: 12.ss,bottom: 12),
        child: Column(
          children: [
            // Top Design
            Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome !',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 25.ss,color: ColorTheme.gray)),
                      Stack(
                          children: [
                            Text('Chandan Sharma',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 25.ss,color: ColorTheme.dark),),

                            Padding(
                              padding: EdgeInsets.only(left: 2.ss,top: 27.ss),
                              child: Container(height: 3.ss,width: 60.ss,
                                  decoration: BoxDecoration(
                                    color: ColorTheme.dark.withOpacity(0.7),
                                    borderRadius: BorderRadius.all(Radius.circular(8.ss)),
                                  )
                              ),),
                          ])
                    ]),
              ),
              Image(image: AssetImage ('assets/images/school_bus.png'),
                height: 90.ss,
                width: 90.ss,),
            ],),

            SizedBox(height: 10.ss,),
            SchoolDetailsWidget(),

            SizedBox(height: 10.ss,),

            DriverDetailsWidget()
          ],
        ),
      ),
    );
  }
}