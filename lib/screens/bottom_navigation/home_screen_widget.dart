
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/models/bus_data.dart';
import 'package:school_route/models/student_data.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/utilities/consts.dart';
import 'package:school_route/widgets/driver_details_widget.dart';
import 'package:school_route/widgets/school_details_widget.dart';
import 'package:sizing/sizing.dart';

class HomeScreenWidget extends StatefulWidget{
  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final String studentStringJson = '''
    {
        "student": {
            "name": "John Doe",
            "class": "V",
            "section": "A",
            "image" : "assets/images/student_pic.jpg",
        "school": {
            "name": "D.A.V Public School",
            "contact": "8969893457",
            "address": "New York"
        }
    }
        
    }
''';

  final String busStringJson = '''{
  "bus": {
      "van_no": "12",
    "bus_number": "M.P.09-7621A",
    "driver": {
      "name": "James Smith",
      "contact": "8864020640"
    }
  }
}''';

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> studentJson = json.decode(studentStringJson);
    final Student student = Student.fromJson(studentJson[Consts.STUDENT]);

    final Map<String,dynamic> busJson = json.decode(busStringJson);
    final Bus bus = Bus.fromJson(busJson[Consts.BUS]);

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
              Expanded(
                child: Image(image: AssetImage ('assets/images/school_bus.png'),
                  height: 90.ss,
                  width: 90.ss,),
              ),
            ],),

            SizedBox(height: 10.ss,),
            SchoolDetailsWidget(
              studentImage: student.image,
              studentName: student.name,
              className: student.classs,
              section: student.section,
              schoolName: student.school.name,
              contactNumber: student.school.contact,
              schoolAddress: student.school.address,
            ),

            SizedBox(height: 10.ss,),

            DriverDetailsWidget(
              vanNo: bus.vanNo,
              driverName: bus.driver.name,
              contact: bus.driver.contact,
              busNumber: bus.busNumber,
            ),
          ],
        ),
      ),
    );
  }
}