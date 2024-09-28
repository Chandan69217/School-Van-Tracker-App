import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_route/animations/slide_up_animation.dart';
import 'package:school_route/screens/login_screen.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:school_route/widgets/custom_container.dart';
import 'package:school_route/widgets/custom_text_field.dart';
import 'package:sizing/sizing.dart';




class RegistrationScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState()=>RegistrationScreenStates();

}

class RegistrationScreenStates extends State<StatefulWidget> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: SlideUpAnimation(
            milliseconds: 800,
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
                          CustomTextField(obscureCharacter: '.', obscureText: false,
                          hintText: 'Mobile No',
                          maxLength: 10,
                          prefixIcon: Icon(Icons.phone_android),
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
                          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],),
                          SizedBox(height: 30.ss,),
                          CustomTextField(obscureCharacter: '*', obscureText: true,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIconButton: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,),
                          SizedBox(height: 30.ss,),
                          CustomTextField(obscureCharacter: '*', obscureText: true,
                          prefixIcon: Icon(Icons.password),
                          suffixIconButton: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                          hintText: 'Confirm Password',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,),
                          SizedBox(height: 30.ss,),
                          SizedBox(height: 50.ss,
                          child: ElevatedButton(
                              onPressed: (){},
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

}