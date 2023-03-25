import 'dart:async';


import 'package:fire_base_complete/home_page.dart';
import 'package:fire_base_complete/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/post/post_screen.dart';

class SplashServices{

  void isLogin(BuildContext , context){
    final auth  = FirebaseAuth.instance;
    final user = auth.currentUser ;
    if(user != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PostScreen()));
      });
    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      });
    }
  }
}