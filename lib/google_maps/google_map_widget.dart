import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_route/service/location_service.dart';
import 'package:school_route/utilities/color_theme.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => MapState();
}


class MapState extends State<GoogleMapWidget> {
  late GoogleMapController _controller;
  Set<Marker> marker = Set();
  Future<Stream<Position>>? currentLocationStream;
  Position? _position;

  @override
  void initState() {
    super.initState();
    currentLocationStream = LocationService.getCurrentLocationStream();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: currentLocationStream,
        builder: (context,snapshot){
          if(snapshot.hasData){
            snapshot.data!.listen((Position position){
              setState(() {
                _position = position;
              });
            });
            if(_position !=null){
              marker.add(Marker(markerId: MarkerId('Your Location')
                  ,icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(_position!.latitude,_position!.longitude)
              ));
              return GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(_position!.latitude, _position!.longitude),zoom: 18.0),
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



}





