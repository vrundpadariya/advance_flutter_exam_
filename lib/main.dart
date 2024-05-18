import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/homepage/homepage.dart';
import 'app/views/splash_screen/splash_screen.dart';

void main(){
  runApp(){
   GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/', page: () => SplashScreen(),),
      GetPage(name: '/home', page: () => homepage(),),
    ],
  );
  };
}