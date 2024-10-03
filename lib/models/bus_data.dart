

import 'package:school_route/utilities/consts.dart';

class Bus{
  String busNumber;
  String vanNo;
  Driver driver;
  Bus({required this.busNumber,required this.vanNo,required this.driver});
  factory Bus.fromJson(Map<String,dynamic> json){
    return Bus(
      vanNo: json[Consts.VAN_NO],
        busNumber: json[Consts.BUS_NUMBER],
      driver: Driver.fromJson(json[Consts.driver]),
    );
  }
}


class Driver{
   String name;
   String contact;

  Driver({required this.name,required this.contact});

  factory Driver.fromJson(Map<String,dynamic> json){
    return Driver(
        name: json[Consts.NAME],
        contact: json[Consts.CONTACT]);
  }
}