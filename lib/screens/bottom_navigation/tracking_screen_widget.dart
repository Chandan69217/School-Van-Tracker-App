

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/screens/registration_screen.dart';
import 'package:school_route/screens/tracker_screen.dart';
import 'package:school_route/widgets/tracking_details_listtitle.dart';
import 'package:sizing/sizing.dart';

class TrackingScreenWidget extends StatefulWidget{
  @override
  State<TrackingScreenWidget> createState() => _TrackingScreenWidgetState();
}

class _TrackingScreenWidgetState extends State<TrackingScreenWidget>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TrackingDetailsListTitle(onTrackPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackerScreen()));
            },onCallPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
          },title: 'Sandeep Kumar Singh', driverName: 'Ramesh Kumar', busNo: 'BR 09 WG 3184', imagePath: 'assets/images/profile_image.jpg'),
          SizedBox(height: 5.ss,),
          TrackingDetailsListTitle(onCallPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));},onTrackPressed:
          (){
      
          },title: 'Sandeep Kumar Singh', driverName: 'Ramesh Kumar', busNo: 'BR 09 WG 3184', imagePath: 'assets/images/profile_image.jpg'),
        ],
      ),
    );

  }

}








