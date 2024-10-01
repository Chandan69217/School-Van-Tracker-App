


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_route/models/consts.dart';
import 'package:school_route/screens/login_screen.dart';
import 'package:school_route/widgets/student_details_card.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/profile_pic_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizing/sizing.dart';

class ProfileScreenWidget extends StatefulWidget {
  ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24.ss),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePic(borderColor: ColorTheme.yellow,imagePath: 'assets/images/profile_image.jpg',),

           SizedBox(height: 10.ss,),
           Text('Chandan Sharma',style: Theme.of(context).textTheme.headlineLarge,),
           SizedBox(height: 20,),

           Container(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(8.ss)),
                 color: ColorTheme.gray.withOpacity(0.2)
             ),
             child: Padding(
               padding: EdgeInsets.only(left: 12.ss),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   Row(crossAxisAlignment: CrossAxisAlignment.start, children: [ Padding(padding: EdgeInsets.only(top: 14.ss),child: Text('Personal Details',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12,color: ColorTheme.gray_dark.withOpacity(0.66),))), SizedBox(width: MediaQuery.of(context).size.width*0.46,),IconButton(onPressed: (){},icon: Icon(Icons.edit),style: ButtonStyle(iconColor: WidgetStatePropertyAll(ColorTheme.gray_dark.withOpacity(0.66)),iconSize: WidgetStatePropertyAll(20.ss))),],),

                   Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/gender_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Gender'),Text('Male')]),],),

                   SizedBox(height: 5,),
                   Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Mobile No'),Text('8969893457')]),],),

                   SizedBox(height: 5,),
                   Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/cake_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Date Of Birth'),Text('03/09/2004')]),],),

                   SizedBox(height: 5,),

                   Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/location_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Address'),Text('Pundaul - Goh Aurangabad 824203')]),],),

                   SizedBox(height: 10,)

                 ],
               ),
             ),
           ),

           SizedBox(height: 20.ss,),

           StudentDetailsCard(
             childImage: 'assets/images/student_pic.jpg',
             childName: 'Arnav Sharma',
             className: 'VI',
             DOB: '08/06/2013',
             sec: 'A',
             rollNo: '24',
             mob: '9771046631',
             studentID: '2014758',
           ),

            SizedBox(height: 30.ss,),
            SizedBox(height: 50.ss,child: ElevatedButton(onPressed: (){
              logout();
            }, child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Logout', style: Theme
                .of(context)
                .textTheme
                .headlineMedium,),
              SizedBox(width: 5.ss,),
              Icon(Icons.logout,color: ColorTheme.gray_dark,)],),
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(ColorTheme.red.withOpacity(0.8.s))),))
          ],
        ),
      ),
    );
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(Consts.IS_LOGIN, false);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()),(Route<dynamic> route) => false,);
  }
}




// Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/gender_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Gender'),Text('Male')]),],),
//
// SizedBox(height: 5,),
// Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Mobile No'),Text('8969893457')]),],),
//
// SizedBox(height: 5,),
// Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/cake_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5.ss,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Date Of Birth'),Text('03/09/2004')]),],),
//
// SizedBox(height: 5,),
//
// Row( crossAxisAlignment: CrossAxisAlignment.center,children: [SvgPicture.asset('assets/images/icons/location_icon.svg',width: 24.ss,height: 24.ss,),SizedBox(width: 5,),Column( crossAxisAlignment: CrossAxisAlignment.start,children: [Text('Address'),Text('Pundaul - Goh Aurangabad 824203')]),],),
//
// SizedBox(height: 10,)