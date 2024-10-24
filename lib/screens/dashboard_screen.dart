
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/screens/bottom_navigation/home_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/notification_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/profile_screen_widget.dart';
import 'package:school_route/screens/bottom_navigation/tracking_screen_widget.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/bottom_navigation_icon.dart';

class DashboardScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>DashboardScreenStates();

}

class DashboardScreenStates extends State<StatefulWidget>{
  int currentIndex = 0;
  late List<Widget> screen;

  @override
  void initState() {
    super.initState();
    screen = [HomeScreenWidget(),TrackingScreenWidget(),NotificationScreenWidget(),ProfileScreenWidget()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),



      body: screen[currentIndex],


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
}