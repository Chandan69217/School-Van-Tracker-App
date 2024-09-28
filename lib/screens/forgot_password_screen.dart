import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_route/animations/slide_up_animation.dart';
import 'package:school_route/screens/registration_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:sizing/sizing.dart';



class ForgotPasswordScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ForgotPasswordScreenStates();
}




class ForgotPasswordScreenStates extends State<StatefulWidget> with SingleTickerProviderStateMixin{


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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Forget Your Password',style: Theme.of(context).textTheme.headlineLarge,),
                      SizedBox(height: 20.ss,),
                      Text('Keep Safe Your Password!',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorTheme.gray),),
                      SizedBox(height: 30.ss,),
                      CustomContainer(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.ss,horizontal: 24.ss),
                          child: Column(
                            children: [
                              SizedBox(height: 30.ss,),
                              CustomTextField(obscureCharacter: '.', obscureText: false,
                              hintText: 'Enter Registered Mobile No',
                              maxLength: 10,
                              prefixIcon: Icon(Icons.phone_android),
                              textInputType: TextInputType.phone,
                              textInputAction: TextInputAction.done,),
                              SizedBox(height: 30.ss,),
                              SizedBox(height: 50.ss,
                              child: ElevatedButton(onPressed: (){},
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.sms,color: ColorTheme.dark,),
                                      SizedBox(width: 5.ss,),
                                      Text('Send OTP',style:  Theme.of(context).textTheme.headlineSmall),
                                    ],)),),
                              SizedBox(height: 12.ss,),
                              TextButton(onPressed: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));},
                                  child: Text(
                                    'Create New Account?', style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineSmall,)),

                              SizedBox(height: 230.ss,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            ),
          ),
    );
  }

}