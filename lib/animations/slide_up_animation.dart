// import 'package:flutter/cupertino.dart';
//
// class SlideUpAnimation extends StatefulWidget{
//   final Widget child;
//   final int milliseconds;
//
//   SlideUpAnimation({
//     required this.child,
//     required this.milliseconds,
//   });
//
//   @override
//   State<StatefulWidget> createState() => SlideUpAnimationStates();
//
//
// }
//
//
// class SlideUpAnimationStates extends State<StatefulWidget> with SingleTickerProviderStateMixin{
//
//   AnimationController controller;
//   Widget child;
//   int milliseconds;
//   late Animation<Offset> animation;
//
//
//   SlideUpAnimationStates({
//     required this.controller,
//     required this.child,
//     required this.milliseconds,
// });
//
//
//   @override
//   void initState() {
//     super.initState();
//       controller = AnimationController(vsync: this,duration: Duration(milliseconds: milliseconds));
//       animation = Tween<Offset>(begin:Offset(0,1.5),end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
//       controller.forward();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(position:animation,child:child,);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
// }
//
//
