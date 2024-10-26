import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:school_route/widgets/tracker_list_title.dart';
import 'package:sizing/sizing.dart';
import '../service/location_service.dart';
import '../utilities/color_theme.dart';



class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    //LocationService.requestPermission(context);
    WidgetsBinding.instance.addObserver(this);
  }
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
              child: _GoogleMapWidget(),
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

    @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){

    }else{
    }
  }

    @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}






class _GoogleMapWidget extends StatefulWidget {
  const _GoogleMapWidget({super.key});

  @override
  State<_GoogleMapWidget> createState() => _MapState();
}

class _MapState extends State<_GoogleMapWidget> with WidgetsBindingObserver{
  Set<Marker> marker = Set();
  Future<Stream<Position>>? _currentLocationStream;
  Position? _position;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentLocationStream = LocationService.getCurrentLocationStream(context);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      check();
    }
  }

  Future<void> check()async {
    var status = await Permission.location.status;
    if(status == PermissionStatus.granted){
      setState(() {
        _currentLocationStream = LocationService.getCurrentLocationStream(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _currentLocationStream,
        builder: (context,snapshot){
          if(snapshot.hasData){
            snapshot.data!.listen((Position position){
              setState(() {
                if(!position.isMocked)
                  _position = position;
              });
            });
            if(_position !=null){
              marker.add(Marker(markerId: MarkerId('Your Location')
                  ,icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(_position!.latitude,_position!.longitude)
              ));
              return GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(_position!.latitude, _position!.longitude),zoom: 14.0),
                markers: marker,
              );
            }
            return Center(child: CircularProgressIndicator(color: ColorTheme.yellow,),);
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return Center(child: CircularProgressIndicator(color: ColorTheme.yellow,));
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

}
