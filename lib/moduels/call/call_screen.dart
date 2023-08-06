import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zchat/models/call/call_model.dart';
import 'package:zchat/moduels/call/cubit/cubit.dart';
import 'package:zchat/moduels/call/cubit/states.dart';

class CallScreen extends StatelessWidget {
 final CallModel? model;

  const CallScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CallCubit, CallStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CallEndTimerState) {
           CallCubit.get(context). stopTimer();
          }
          if (state is CallStartTimerState) {
            CallCubit.get(context). startTimer(state.seconds);
          }
          // if (state is CallStartState) {
          //   CallCubit.get(context). startTimer(state.seconds);
          // }

        },
        builder: (context, state) {
          var cubit = CallCubit.get(context);
          return Scaffold(
              body: Stack(
                children: [
                  ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Image.asset(
                        '${model!.image}',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                    '${model!.image}'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${model!.name}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '${cubit.timeToString(cubit.timeCount!)}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500
                          ),
                        ),

                        SizedBox(height:MediaQuery.of(context).size.height*0.2),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child:SvgPicture.asset('assets/icons/message-call.svg',height: 28,width: 28,)
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 70,
                                    height:70,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                       color: HexColor('B83020'),

                                    ),
                                    child:SvgPicture.asset('assets/icons/call-end-screen.svg',height: 30,width: 30,)
                                    ,
                                  ),
                                ),
                                Container(
                                    child:SvgPicture.asset('assets/icons/VolumeHigh.svg',height: 30,width: 30,)
                                ),

                              ]
                          ),
                        )



                      ],
                    ),
                  ),


                  // Image.asset(
                  //   'assets/images/african-american-man-wearing-round-glasses-denim-shirt.jpg',
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  //   fit: BoxFit.cover,
                  //
                  // )
                ],
              ),
            );
        },
),
    );
  }
}
