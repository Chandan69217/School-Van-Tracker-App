
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/screens/splash_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/utilities/theme_data.dart';
import 'package:sizing/sizing.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SizingBuilder(
     builder: () => AnnotatedRegion(
         value: SystemUiOverlayStyle(
             statusBarColor: ColorTheme.yellow.withOpacity(0.7),
             statusBarIconBrightness: Brightness.dark
         ),
         child: MaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'School Route',
           theme: MyThemeData(),
           home: SplashScreen(),
         ),
       ),
   );
  }
}
