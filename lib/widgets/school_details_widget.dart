import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';
import 'custom_text.dart';

class SchoolDetailsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       //Text Track Your School Bus
       Container(
           alignment: Alignment.centerLeft,
           child: CustomText(
             text: 'Track Your School Bus',
             color: ColorTheme.indigo,)
       ),

       SizedBox(height: 10.ss,),
       //Container School Details Design
       Container(
         width: MediaQuery.sizeOf(context).width,
         decoration: BoxDecoration(
             color: ColorTheme.indigo.withOpacity(0.7),
             borderRadius: BorderRadius.all(Radius.circular(8.ss))
         ),

         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 10.ss,horizontal: 10.ss),
           child: Column(

             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     width: 50.ss,
                     height: 50.ss,
                     decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage('assets/images/school_image.jpg'),fit: BoxFit.cover),
                       borderRadius: BorderRadius.all(Radius.circular(8.ss)),
                       border: Border.all(width: 1.ss,color: Colors.white),
                     ),
                   ),
                   SizedBox(width: 8.ss,),

                   Expanded(child: RichText(text: TextSpan(text: 'School Name',children: [TextSpan(text: '\n'),TextSpan(text: 'D.A.V Public School')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),))),
                 ],
               ),

               SizedBox(height: 5.ss,),
               
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.ss),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                     SizedBox(width: 10.ss,),
                     Expanded(child: RichText(text: TextSpan(text: 'Contact Number',children: [TextSpan(text: '\n'),TextSpan(text: '8969893457')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),))),
                   ],
                 ),
               ),

               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SvgPicture.asset('assets/images/icons/location_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white.withOpacity(0.9),),
                   SizedBox(width: 10.ss,),
                   Expanded(child: RichText(text: TextSpan(text: 'School Address',children: [TextSpan(text: '\n'),TextSpan(text: 'Reference Site About Lorem Ipsum, Giving Indore M.P, 452009')],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),))),
                 ],
               )

             ],
           ),
         ),
       ),
     ],
   );
  }

}



// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     SvgPicture.asset('assets/images/icons/phone_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white,),
//     SizedBox(width: 6.ss,),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Contact Number',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//         Text('8969893457',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
//
//       ],
//     )
//   ],
// ),

// SizedBox(height: 5.ss,),
//
// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     SvgPicture.asset('assets/images/icons/location_icon.svg',width: 25.ss,height: 25.ss,color: Colors.white,),
//     SizedBox(width: 6.ss,),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('School Address',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//         Text('Cantt-Area,Gaya-823001',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
//       ],
//     )
//   ],
// ),

// SizedBox(height: 20.ss,),
//
// Row(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       width: 90.ss,
//       height: 90.ss,
//       decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/images/student_pic.jpg'),
//               fit: BoxFit.fill),
//           border: Border.all(width: 2.ss,color: Colors.white.withOpacity(0.8)),
//           borderRadius: BorderRadius.all(Radius.circular(8.ss))
//       ),
//     ),
//     SizedBox(width: 15.ss,),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Text('Student Name',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//         Text('Arnav Sharma',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//
//         Row(
//           children: [
//             Text('Class : ',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//             Text('VI',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
//           ],
//         ),
//         Row(
//           children: [
//             Text('Sec : ',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//             Text('A',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
//           ],
//         ),
//         Row(
//           children: [
//             Text('Roll No : ',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
//             Text('24',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),)
//           ],
//         ),

// SizedBox(height: 10.ss,),