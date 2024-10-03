import 'package:school_route/utilities/consts.dart';

class School{
  String name;
  String contact;
  String address;

  School({required this.name,required this.address,required this.contact});

  factory School.fromJson(Map<String,dynamic> json){
     return School(
        name: json[Consts.NAME],
        address: json[Consts.ADDRESS],
        contact: json[Consts.CONTACT]
    );
  }
}

class Student{
  String name;
  String classs;
  String section;
  String image;
  School school;

  Student({required this.name,required this.classs,required this.section,required this.image,required this.school});

  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
        name: json[Consts.NAME],
        classs: json[Consts.CLASS],
        section: json[Consts.SECTION],
        image: json[Consts.IMAGE],
      school: School.fromJson(json[Consts.SCHOOL]),
    );
  }
}



