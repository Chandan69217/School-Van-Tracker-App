import 'package:flutter/cupertino.dart';


class SlideLeftDown extends StatefulWidget {
  final Widget child;
  final int milliseconds;

  SlideLeftDown({
    required this.child,
    required this.milliseconds,
  });

  static AnimationController getController()=> SlideLeftDownState.controller;

  @override
  State<SlideLeftDown> createState() => SlideLeftDownState(child,milliseconds);

}

class SlideLeftDownState extends State<SlideLeftDown> with SingleTickerProviderStateMixin {

  static late AnimationController controller;
  late Widget child;
  late int milliseconds;
  late Animation<Offset> animation;

  SlideLeftDownState(Widget child,int milliseconds){
    this.child = child;
    this.milliseconds = milliseconds;
  }


  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: milliseconds));
    animation = Tween<Offset>(begin:Offset(-0.5,-0.5),end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(position:animation,child:child,);
  }
}
