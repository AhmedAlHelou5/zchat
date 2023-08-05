import 'package:flutter/material.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text('Login',style: TextStyle(fontSize: 50,color: Colors.black))),

    );
  }
}
