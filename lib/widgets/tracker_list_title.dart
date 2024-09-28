

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizing/sizing.dart';

import '../utilities/color_theme.dart';

class TrackerListTitle extends StatelessWidget {

  final double iconVisibility;
  final String arrivalTime;
  final String arrivedTime;
  final String stoppageName;
  final String stoppageDistance;
  final String stoppageNo;
  final String departureTime;
  final String departedTime;
  final BorderRadius borderRadius;

  TrackerListTitle({
    this.iconVisibility = 0,
    this.arrivalTime='',
    this.arrivedTime='',
    this.stoppageName ='',
    this.stoppageDistance='',
    this.departedTime='',
    this.departureTime='',
    this.stoppageNo='',
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 24.ss,right: 24.ss),
      child: Container(
        height: 100.ss,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Expanded(
                flex: 0,
                child: RichText(text: TextSpan(children: [TextSpan(text: arrivalTime),TextSpan(text: '\n'),TextSpan(text: arrivedTime)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12.ss)),)
            ),

            SizedBox(width: 10.ss,),
            Expanded(
                flex: 0,
                child:Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 19.ss,
                      decoration: BoxDecoration(
                        color: ColorTheme.yellow.withOpacity(0.9),
                        borderRadius: borderRadius ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22.0),
                      child: Container(
                        height: 13.ss,
                        width: 13.ss,
                        decoration: BoxDecoration(
                            color:  ColorTheme.dark,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),

                    Opacity(
                      opacity: iconVisibility,
                      child: CircleAvatar(
                        backgroundColor: ColorTheme.indigo,
                        child: Icon(Icons.directions_bus,color: Colors.white),
                      ),
                    )

                  ],
                )
            ),
            SizedBox(width: 10.ss,),

            Expanded(
                flex: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(children: [TextSpan(text: stoppageName),TextSpan(text: '\n'),TextSpan(text: stoppageDistance),TextSpan(text: ' km'),TextSpan(text: ' stop: '),TextSpan(text: stoppageNo)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12.ss)))
                  ],

                )),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(children: [TextSpan(text: departureTime),TextSpan(text: '\n'),TextSpan(text: departedTime)],style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12.ss)))
              ],

            )),
          ],

        ),
      ),
    );
  }
}
