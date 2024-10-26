import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';

class LocationService {

  static Future<Position> getCurrentLocation(BuildContext context) async {
    var isPermissionAccess = await _requestPermission(context);

    if (isPermissionAccess) {
      _checkMocked(context);
      return Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    } else {
      return Future.error('error while fetching user current location');
    }
  }

  static Future<Stream<Position>> getCurrentLocationStream(
      BuildContext context) async {
    var permissionStatus = await _requestPermission(context);
    if (permissionStatus) {
      _checkMocked(context);
      return Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ));
    } else {
      return Future.error('unable to fetch user current location');
    }
  }

  static Future<bool> _requestPermission(BuildContext context) async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
      isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        return false;
      }
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.values) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      _showDialog(context);
      return false;
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> _isMockedLocation() async {
    bool isMocked = false;
    var status = await Geolocator.checkPermission();
    var isLocationOn = await Geolocator.isLocationServiceEnabled();
    if (status == LocationPermission.whileInUse ||
        status == LocationPermission.always && isLocationOn) {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
      if (position.isMocked) {
        isMocked = true;
      }
    }
    return isMocked;
  }

  static void _checkMocked(BuildContext context) async {

    if (await LocationService._isMockedLocation()) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              headerAnimationLoop: false,
              dismissOnTouchOutside: false,
              dismissOnBackKeyPress: false,
              btnOkOnPress: () {
                Navigator.of(context).popUntil((route){ return route.isFirst;});
              },
              title: 'Mocked Location detected',
              desc: 'please turn off mocked location to use this app.')
          .show();
    }
  }

  static void _showDialog(BuildContext context) async {
    AwesomeDialog(
        context: context,
        body: Padding(
          padding: EdgeInsets.all(12.ss),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 8.ss,
                  ),
                  Expanded(
                      child: Text(
                    'Open app settings',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w600),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.ss, top: 18.ss, right: 16.ss),
                child: Text(
                  'allow location permission manually from your app settings.',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            ],
          ),
        ),
        dismissOnTouchOutside: false,
        animType: AnimType.bottomSlide,
        dialogType: DialogType.noHeader,
        btnCancel: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: ColorTheme.red),
            )),
        btnOk: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Geolocator.openAppSettings();
          },
          child: const Text(
            'Ok',
            style: TextStyle(color: ColorTheme.green),
          ),
        )).show();
  }
}
