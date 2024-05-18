import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: const [
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/splash_screen.gif'),
            ),
          ),

                  ],
      ),
    );
  }
}