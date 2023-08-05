import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Image.asset(
                  'assets/images/african-american-man-wearing-round-glasses-denim-shirt.jpg',
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
                              'assets/images/african-american-man-wearing-round-glasses-denim-shirt.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'My babe',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '3 : 25',
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
      ),
    );
  }
}
