import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/homepage/homepage.dart';
import 'app/views/splash_screen/splash_screen.dart';

void main(){
  runApp(){
   GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: '/', page: () => SplashScreen(),),
      GetPage(name: '/home', page: () => homepage(),),
    ],
  );
  };
}