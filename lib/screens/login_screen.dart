// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:school_route/api/api.dart';
import 'package:school_route/screens/dashboard_screen.dart';
import 'package:school_route/screens/forgot_password_screen.dart';
import 'package:school_route/screens/registration_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizing/sizing.dart';

import '../utilities/consts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin,WidgetsBindingObserver{

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
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  List<ConnectivityResult> _connectivityStatus = [ConnectivityResult.none];



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    animation = Tween<Offset>(begin:Offset(0,1.5),end: Offset.zero).animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));
    controller!.forward();
    _initConnectivity();
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
                          labelText: 'Email ID',
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
                          labelText: 'Password',
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

    // print('before trim: $email');
    // print('after remove all: ${email.replaceAll(RegExp(r'\s+'), '')}');
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
    if(_connectivityStatus.contains(ConnectivityResult.mobile) || _connectivityStatus.contains(ConnectivityResult.wifi) || _connectivityStatus.contains(ConnectivityResult.vpn)){

      try{
        final result = await InternetAddress.lookup('google.com');
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          try {
            response = await getResponse('/api/login', body);
          }catch(exception){
           showToast('Internet is too slow');
           setState(() {
              isLoading = false;
            });
            return;
          }

          if(response!.statusCode == 200){
            final prefs = await SharedPreferences.getInstance();
            final jsonBody = jsonDecode(response!.body);
            prefs.setBool(Consts.IS_LOGIN, true);
            prefs.setString(Consts.USER_TOKEN,jsonBody[Consts.USER_TOKEN]);
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>
                    DashboardScreen()));
          }else{
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              headerAnimationLoop: false,
              title: 'Invalid Credentials',
              desc: 'Please enter valid email & password',
              btnOkOnPress: (){}
            ).show();
          }
        }else{
          showToast('No internet access');
        }

      } on SocketException catch(_){
        showToast('No internet access');
      }

    }else{
      showToast('No internet connection');
    }

    setState(() {
      isLoading = false;
    });

  }

  
@override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if(MediaQuery.of(context).viewInsets.bottom !=0){
      if(View.of(context).viewInsets.bottom == 0){
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
      }
    }

  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    controller!.dispose();
    _streamSubscription.cancel();
  }

  Future<void> _initConnectivity() async{
    try{
      _connectivityStatus = await _connectivity.checkConnectivity();
      setState((){});
      _streamSubscription = _connectivity.onConnectivityChanged.listen((result){_connectivityStatus = result;});
    }catch(exception){
      log(exception.toString());
      return;
    }
    if(!mounted){
      return Future.value('null');
    }
  }

  void showToast(String message){
    Fluttertoast.showToast(msg: message,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.white,textColor: ColorTheme.gray_dark);
  }
}
