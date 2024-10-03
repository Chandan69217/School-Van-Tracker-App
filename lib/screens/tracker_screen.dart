import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_route/google_maps/google_map_widget.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/tracker_list_title.dart';
import 'package:sizing/sizing.dart';



class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track School Van'),
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height*0.3,
              child: GoogleMapWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.3),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                   // borderRadius: BorderRadius.only(topLeft: Radius.circular(50.ss),topRight: Radius.circular(50.ss))
                  ),
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return setListTitle(index);
                    },
                    itemCount: 11,
                  ),
                ),
              ),
            )
            ]
          )
      )
    );
  }

  TrackerListTitle setListTitle(int index){
    double visibility;
    if(index ==2){
      visibility = 1;
    }else{
      visibility = 0;
    }
     if(index == 0){
       return TrackerListTitle(
         arrivalTime: 'Start',
         arrivedTime: '4:57 AM',
         iconVisibility: visibility,
         stoppageName: 'Gaya',
         stoppageDistance: '0',
         stoppageNo: '0',
         departedTime: '6:07 PM',
         departureTime: '6:00 PM',
         borderRadius: BorderRadius.only(topLeft: Radius.circular(8.ss),topRight: Radius.circular(8.ss)),
       );
     }else if(index == 10){
       return TrackerListTitle(
         arrivalTime: 'Start',
         arrivedTime: '4:57 AM',
         iconVisibility: visibility,
         stoppageName: 'Gaya',
         stoppageDistance: '0',
         stoppageNo: '0',
         departedTime: '6:07 PM',
         departureTime: '6:00 PM',
         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.ss),bottomRight: Radius.circular(8.ss)),
       );
     }else {
       return TrackerListTitle(
         arrivalTime: 'Start',
         arrivedTime: '4:57 AM',
         iconVisibility: visibility,
         stoppageName: 'Gaya',
         stoppageDistance: '0',
         stoppageNo: '0',
         departedTime: '6:07 PM',
         departureTime: '6:00 PM',
         borderRadius: BorderRadius.zero,
       );
     }

    }

}



