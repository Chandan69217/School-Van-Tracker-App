import 'package:geolocator/geolocator.dart';

class LocationService{

  // static Future<Position> getCurrentLocation() async{
  //   bool checkedPermission = await checkPermission();
  //   if(checkedPermission){
  //     return Geolocator.getCurrentPosition();
  //   }else{
  //     return Future.error('Permission Error');
  //   }
  // }

   static Future<Position> getCurrentLocation() async{

    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
        if(!isServiceEnabled){
       await Geolocator.openLocationSettings();
    }

    LocationPermission permission = await Geolocator.checkPermission();
        if(permission == LocationPermission.denied || permission == LocationPermission.values){
         permission = await Geolocator.requestPermission();
        }


        if(permission == LocationPermission.deniedForever){
          await Geolocator.openAppSettings().then((bool value)async{
            if(value){
              permission = await Geolocator.checkPermission();
            }
          });

        }

        if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
          return Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
        }else{
          return Future.error('error while fetching user current location');
        }

  }





   static Future<Stream<Position>> getCurrentLocationStream() async{

     bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
     if(!isServiceEnabled){
       await Geolocator.openLocationSettings();
     }

     LocationPermission permission = await Geolocator.checkPermission();
     if(permission == LocationPermission.denied || permission == LocationPermission.values){
       permission = await Geolocator.requestPermission();
     }


     if(permission == LocationPermission.deniedForever){
       await Geolocator.openAppSettings().then((bool value)async{
         if(value){
           permission = await Geolocator.checkPermission();
         }
       });

     }

     if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
     //  return Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
       return Geolocator.getPositionStream(locationSettings: const LocationSettings(accuracy: LocationAccuracy.high,));
     }else{
       return Future.error('error while fetching user current location');
     }

   }





  // static Future<bool> checkPermission() async {
  //   bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if(!isServiceEnabled){
  //     await Geolocator.openLocationSettings();
  //     return false;
  //   }
  //
  //   if(permission == LocationPermission.deniedForever||permission == LocationPermission.unableToDetermine){
  //     await Geolocator.openAppSettings();
  //     return false;
  //   }
  //
  //   if(permission == LocationPermission.denied){
  //     await Geolocator.requestPermission();
  //     return false;
  //   }
  //
  //   if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
  //     return true;
  //   }else{
  //     return false;
  //   }
  // }
}

