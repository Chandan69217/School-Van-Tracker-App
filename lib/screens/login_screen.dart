

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_route/animations/slide_up_animation.dart';
import 'package:school_route/main.dart';
import 'package:school_route/screens/dashboard_screen.dart';
import 'package:school_route/screens/forgot_password_screen.dart';
import 'package:school_route/screens/registration_screen.dart';
import 'package:school_route/screens/splash_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:sizing/sizing.dart';



class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  final TextEditingController mobileTextFieldController = TextEditingController();
  final TextEditingController passwordTextFieldController = TextEditingController();



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SlideUpAnimation(
              milliseconds: 1000,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      Text('Welcome Back!', style: Theme
                          .of(context)
                          .textTheme
                          .headlineLarge,),
                      Text('Login to Continue', style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorTheme.gray),),
                      SizedBox(height: 50.ss,),
                      CustomContainer(
                        child: Padding(
                          padding: EdgeInsets.all(24.ss),
                          child: Column(
                            children: [
                              SizedBox(height: 40.ss,),
                              CustomTextField(
                                controller: mobileTextFieldController,
                                maxLength: 10,
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                textInputFormatter: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                obscureText: false,
                                obscureCharacter: '.',
                                prefixIcon: Icon(Icons.phone_android),
                                hintText: 'Mobile No',
                              ),
                              SizedBox(height: 30.ss,),
                              CustomTextField(
                                controller: passwordTextFieldController,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                obscureCharacter: '*',
                                prefixIcon: Icon(Icons.password),
                                suffixIconButton: IconButton(onPressed: () {},
                                    icon: Icon(Icons.remove_red_eye)),
                                hintText: 'Password',
                              ),
                              Container(
                                  alignment: Alignment.centerRight,
                                  height: 33.ss,
                                  child: TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));},
                                      child: Text(
                                        'Forgot Password?', style: Theme
                                          .of(context)
                                          .textTheme
                                          .headlineSmall,))),
                              SizedBox(height: 18.ss,),
                              SizedBox(
                                height: 50.ss,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          DashboardScreen()));
                                },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.login,
                                          color: ColorTheme.gray_dark,),
                                        SizedBox(width: 5.ss,),
                                        Text('Login', style: Theme
                                            .of(context)
                                            .textTheme
                                            .headlineMedium,)
                                      ],)
                                ),
                              ),
                              SizedBox(height: 12.ss,),
                              TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));},
                                  child: Text(
                                    'Create New Account?', style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall,)),

                              SizedBox(height: 160,)
                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ),
      );
    }

  }