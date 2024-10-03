import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/utilities/consts.dart';
import 'package:school_route/screens/dashboard_screen.dart';
import 'package:school_route/screens/login_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizing/sizing.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController controller;
  late final Animation<double> animation;


  @override
  void initState(){
    checkLoginStatus();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.repeat(reverse: false);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.yellow,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: 300.ss,
              height: 300.ss,
              padding: EdgeInsets.all(16),
              child: Image(image: AssetImage('assets/images/school_bus.png')),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void checkLoginStatus() async{
    final prefs = await SharedPreferences.getInstance();
    final bool? islogin = prefs.getBool(Consts.IS_LOGIN);

    Timer(const Duration(milliseconds: 2000),(){
      Navigator.pushReplacement((context),
        MaterialPageRoute(builder: (context){
          if(islogin != null){
            if(islogin){
              return DashboardScreen();
            }else{
              return LoginScreen();
            }
          }else{
            return LoginScreen();
          }
        })
      );
    });


  }


}