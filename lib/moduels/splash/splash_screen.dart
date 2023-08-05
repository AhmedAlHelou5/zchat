import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zchat/layout/home/home_layout.dart';
import 'package:zchat/moduels/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomeLayout()
            )
        )
    );
    return const Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Text('ZCHAT',style: TextStyle(fontSize: 50,color: Colors.white),),
      ),


    );
  }
}
