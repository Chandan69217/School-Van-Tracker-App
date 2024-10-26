
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/screens/bottom_navigation/home_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/notification_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/profile_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/tracking_screen_widget.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/bottom_navigation_icon.dart';
import 'package:sizing/sizing.dart';

class DashboardScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>DashboardScreenStates();

}

class DashboardScreenStates extends State<StatefulWidget> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  final List<Widget> screen = [HomeScreenWidget(),TrackingScreenWidget(),NotificationScreenWidget(),ProfileScreenWidget()];
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  List<ConnectivityResult> _connectivityStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  bool networkStatus = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    _animation = Tween<Offset>(begin: Offset(0,-1),end: Offset.zero).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    _animationController!.forward();
    _initConnection();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
            Visibility(
              visible: networkStatus,
              child: SlideTransition(
                position: _animation!,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color:  ColorTheme.red.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(3.ss),
                    child: Center(child: Text('no internet connection',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ),

          Expanded(child: screen[currentIndex]),
        ],
      ),


      drawer: Drawer(),




      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorTheme.yellow.withOpacity(0.8),
        currentIndex: currentIndex,

        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: BottomNavigationIcon(iconPath: 'assets/images/icons/home_icon.svg',opacity: 0,),
            activeIcon: BottomNavigationIcon(iconPath: 'assets/images/icons/home_icon.svg',iconColor: ColorTheme.yellow,opacity: 1,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:BottomNavigationIcon(iconPath: 'assets/images/icons/location_icon.svg',opacity: 0,),
            activeIcon:BottomNavigationIcon(iconPath: 'assets/images/icons/location_icon.svg',iconColor: ColorTheme.yellow,opacity: 1,),
          label: 'Tracking',
          ),
          BottomNavigationBarItem(
            icon:BottomNavigationIcon(iconPath: 'assets/images/icons/notification_icon.svg',opacity: 0,),
            activeIcon:BottomNavigationIcon(iconPath: 'assets/images/icons/notification_icon.svg',iconColor: ColorTheme.yellow,opacity: 1,),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon:BottomNavigationIcon(iconPath: 'assets/images/icons/person_icon.svg',opacity: 0,),
            activeIcon:BottomNavigationIcon(iconPath: 'assets/images/icons/person_icon.svg',iconColor: ColorTheme.yellow,opacity: 1,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
    _streamSubscription.cancel();
    _timer!.cancel();
  }

  Future<void> _initConnection() async {
    try{
      _connectivityStatus = await _connectivity.checkConnectivity();
      _checkConnectivity();
      setState((){});
      _streamSubscription = _connectivity.onConnectivityChanged.listen((result){setState(() {
        _connectivityStatus = result;
        _checkConnectivity();
      });});
    }catch(exception){
      log(exception.toString());
      return;
    }
    if(!mounted){
      return Future.value('null');
    }
  }

  void _checkConnectivity(){
    if(_connectivityStatus.contains(ConnectivityResult.mobile) || _connectivityStatus.contains(ConnectivityResult.wifi) || _connectivityStatus.contains(ConnectivityResult.vpn)){
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          networkStatus = false;
        }else{
          networkStatus = true;
        }
        setState(() {
        });
      });
  }else{
      setState(() {
        networkStatus = true;
      });
    }
  }

}