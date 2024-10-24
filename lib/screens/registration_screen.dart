import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/screens/login_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:sizing/sizing.dart';




class RegistrationScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>RegistrationScreenStates();

}

class RegistrationScreenStates extends State<StatefulWidget> with SingleTickerProviderStateMixin,WidgetsBindingObserver{
  AnimationController? controller;
  Animation<Offset>? animation;
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool isLoading = false;
  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    animation = Tween<Offset>(begin:Offset(0,1.5),end: Offset.zero).animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));
    controller!.forward();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SlideTransition(
        position: animation!,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Create New Account',style: Theme.of(context).textTheme.headlineLarge,),
                Text('Register to continue',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorTheme.gray),),
                SizedBox(height: 20.ss,),
                CustomContainer(
                    child:Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.ss,horizontal: 24.ss),
                      child: Column(
                        children: [
                          SizedBox(height: 40.ss,),
                          CustomTextField( obscureText: false,
                          focusNode: mobileFocusNode,
                          controller: mobileController,
                          labelText: 'Mobile No',
                          maxLength: 10,
                          prefixIcon: Icon(Icons.phone_android),
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
                          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],),
                          SizedBox(height: 30.ss,),

                          CustomTextField(obscureText: visiblePassword,
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIconButton: IconButton(onPressed: (){
                            setState(() {
                              visiblePassword = !visiblePassword;
                            });
                          }, icon: Icon(visiblePassword ? Icons.visibility_off:Icons.visibility)),
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,),
                          SizedBox(height: 30.ss,),
                          CustomTextField(obscureText: visibleConfirmPassword,
                          focusNode: confirmPasswordFocusNode,
                          controller: confirmPasswordController,
                          prefixIcon: Icon(Icons.password),
                          suffixIconButton: IconButton(onPressed: (){
                            setState(() {
                              visibleConfirmPassword = !visibleConfirmPassword;
                            });
                          }, icon: Icon(visibleConfirmPassword ? Icons.visibility_off:Icons.visibility)),
                          labelText: 'Confirm Password',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,),
                          SizedBox(height: 30.ss,),
                          SizedBox(height: 50.ss,
                          child: ElevatedButton(
                              onPressed: (){
                                register();
                              },
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('Create',style:  Theme.of(context).textTheme.headlineSmall),SizedBox(width: 5.ss,),Icon(Icons.create_outlined),],)
                          ),
                          ),
                          SizedBox(height: 12.ss,),
                          TextButton(onPressed: (){
                            Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context)=> LoginScreen()), (Route<dynamic> route) => false,);
                            },
                              child: Text('Login With Existing Account',style: Theme.of(context).textTheme.headlineSmall,)),

                          SizedBox(height: 40.ss,),
                        ],
                      ),
                    ) ),
              ],
            ),
          ),
        ),
      )),
    );
  }


  void register(){
    String mobile = mobileController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if(mobile.isEmpty){
      mobileFocusNode.requestFocus();
      return;
    }

    if(password.isEmpty){
      passwordFocusNode.requestFocus();
      return;
    }

    if(confirmPassword.isEmpty){
      confirmPasswordFocusNode.requestFocus();
      return;
    }


  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if(MediaQuery.of(context).viewInsets.bottom != 0){
      if(View.of(context).viewInsets.bottom == 0){
        mobileFocusNode.unfocus();
        passwordFocusNode.unfocus();
        confirmPasswordFocusNode.unfocus();
      }
    }
  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

}