import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_route/service/location_service.dart';


class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => MapState();
}

class MapState extends State<GoogleMapWidget> {
  late GoogleMapController _controller;
  Set<Marker> _marker = Set();

  late Position position;
  double _longitude = 84.6606187;
  double _latitude = 24.977703 ;

  @override
  void initState() {
    super.initState();
    getPosition();
    addMarker(_latitude,_longitude);
  }

  // static CameraPosition currentCameraPosition = CameraPosition(
  //   target: LatLng(_latitude, _longitude),
  //    // LatLng(25.626779, 85.1069276),
  //   zoom: 14.4746,
  // );


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(_latitude, _longitude),
        zoom: 14),
        markers: _marker,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
    );
  }

  void getPosition() async {
    position = await LocationService.getCurrentLocation();
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(_latitude,_longitude),zoom: 16)));
      addMarker(_latitude, _longitude);
    });
  }

  void addMarker(double latitude, double longitude) {
    _marker.add(Marker(markerId: MarkerId('Your Location'),icon: BitmapDescriptor.defaultMarker,position: LatLng(latitude, longitude)));
  }

}


