import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  Set<Marker> _marker = Set();

  Position? position;
  Stream<Position>? positionStream;
  double _longitude = 84.6606187;
  double _latitude = 24.977703 ;

  @override
  void initState() {
    super.initState();
   // getCurrentLocation();
    getCurrentLocationStream();
    addMarker(_latitude,_longitude);
  }

  // static CameraPosition currentCameraPosition = CameraPosition(
  //   target: LatLng(_latitude, _longitude),
  //    // LatLng(25.626779, 85.1069276),
  //   zoom: 14.4746,
  // );


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(value: 0.5,color: ColorTheme.yellow.withOpacity(0.7), semanticsLabel: 'Loading Maps ',),
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(_latitude, _longitude),
          zoom: 14),
          markers: _marker,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
      ),]
    );
  }

  void getCurrentLocation() async {
    position = await LocationService.getCurrentLocation();
    setState(() {
      _latitude = position!.latitude;
      _longitude = position!.longitude;
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(_latitude,_longitude),zoom: 16)));
      addMarker(_latitude, _longitude);
    });
  }

  void addMarker(double latitude, double longitude) {
    _marker.add(Marker(
        markerId: MarkerId('Your Location'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),

    ));
  }

  void getCurrentLocationStream() async{
    positionStream = await LocationService.getCurrentLocationStream();
    positionStream!.listen((Position _position){
      position = _position;
      setState(() {
        _latitude = position!.latitude;
        _longitude = position!.longitude;
        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(_latitude,_longitude),zoom: 16)));
        addMarker(_latitude, _longitude);
      });
    });
  }

}


