import 'package:fire_base_complete/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices =SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(BuildContext, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('Firebase Splash Screen'),
      ),
    );
  }
}
