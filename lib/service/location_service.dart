

import 'package:geolocator/geolocator.dart';

class LocationService{


  static Future<Position> getCurrentLocation() async{
    bool checkedPermission = await checkPermission();
    if(checkedPermission){
      return Geolocator.getCurrentPosition();
    }else{
      return Future.error('Permission Error');
    }
  }



  static Future<bool> checkPermission() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if(!isServiceEnabled){
      await Geolocator.openLocationSettings();
      return false;
    }

    if(permission == LocationPermission.deniedForever||permission == LocationPermission.unableToDetermine){
      await Geolocator.openAppSettings();
      return false;
    }

    if(permission == LocationPermission.denied){
      await Geolocator.requestPermission();
      return false;
    }

    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      return true;
    }else{
      return false;
    }
  }
}

