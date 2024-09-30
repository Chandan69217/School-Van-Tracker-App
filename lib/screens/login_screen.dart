import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:school_route/animations/slide_up_animation.dart';
import 'package:school_route/api/api.dart';
import 'package:school_route/screens/dashboard_screen.dart';
import 'package:school_route/screens/forgot_password_screen.dart';
import 'package:school_route/screens/registration_screen.dart';
import 'package:school_route/screens/splash_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:school_route/widgets/dialog_box_widget.dart';
import 'package:sizing/sizing.dart';

import '../models/consts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController emailTextFieldController =
      TextEditingController();
  final TextEditingController passwordTextFieldController =
      TextEditingController();
  AnimationController? controller;
  Animation<Offset>? animation;
  bool obscureText = true;
  bool isLoading = false;
  Response? response;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    animation = Tween<Offset>(begin:Offset(0,1.5),end: Offset.zero).animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlideTransition(
          position: animation!,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Login to Continue',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorTheme.gray),
                ),
                SizedBox(
                  height: 50.ss,
                ),
                CustomContainer(
                  child: Padding(
                    padding: EdgeInsets.all(24.ss),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.ss,
                        ),
                        CustomTextField(
                          focusNode: emailFocusNode,
                          controller: emailTextFieldController,
                          // maxLength: 10,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          // textInputFormatter: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly,
                          // ],
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email ID',
                        ),
                        SizedBox(
                          height: 30.ss,
                        ),

                        CustomTextField(
                          focusNode: passwordFocusNode,
                          controller: passwordTextFieldController,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: obscureText,
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Password',
                          suffixIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              }, icon: obscureText ? Icon(Icons.visibility_off):Icon(Icons.visibility)),
                        ),

                        Container(
                            alignment: Alignment.centerRight,
                            height: 33.ss,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ))),
                        SizedBox(
                          height: 18.ss,
                        ),

                        isLoading ? CircularProgressIndicator(color: Colors.white,):SizedBox(
                          height: 50.ss,
                          child: ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: ColorTheme.gray_dark,
                                        ),
                                        SizedBox(
                                          width: 5.ss,
                                        ),
                                        Text(
                                          'Login',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        )
                                      ],
                                    )
                          ),
                        ),

                        SizedBox(
                          height: 12.ss,
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: Text(
                              'Create New Account?',
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),

                        SizedBox(
                          height: 160,
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }


  void login() async {

    String email = emailTextFieldController.text;
    String password = passwordTextFieldController.text;

    if(email.isEmpty){
      emailFocusNode.requestFocus();
      return;
    }

    if(password.isEmpty){
      passwordFocusNode.requestFocus();
      return;
    }

    Map<String,dynamic> body = {
      Consts.EMAIL : email,
      Consts.PASSWORD : password
    };

    setState(() {
      isLoading = true;
    });

    try {
      response = await getResponse('/api/login', body);
    }catch(exception){
      DialogBox(context: context,content: exception.toString(),onPressedOk: (context){},onPressedCancel: (context){});
    }

    setState(() {
      isLoading = false;
    });

    if(response!.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              DashboardScreen()));
    }else{
      DialogBox(context: context,
        onPressedOk: (BuildContext context) {
          Navigator.pop(context);
        },
        onPressedCancel: (BuildContext context) {  },
        icon: Icons.email_outlined,
        title: 'Invalid Credentials',
        content: 'please retry with valid email and password',
      );
    }

  }


  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }


}
