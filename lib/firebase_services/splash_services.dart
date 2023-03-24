import 'dart:async';


import 'package:fire_base_complete/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext , context){
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));

    });
    // periodic(Duration(seconds: 3), (timer) {
    // });
  }
}