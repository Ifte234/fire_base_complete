import 'package:fire_base_complete/ui/auth/verify_code.dart';
import 'package:fire_base_complete/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/myBtn.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  TextEditingController phonenumberC = TextEditingController();
  bool isloading = false ;
  final auth  = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: phonenumberC,
              decoration: InputDecoration(

                label: Text('Enter Your Phone Number',style: TextStyle(fontWeight: FontWeight.bold),),
                hintText: '+92 123 4567890'
              ),
            ),


            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: MyButton(title: 'LOGIN',onTap: (){
              auth.verifyPhoneNumber(
                phoneNumber: phonenumberC.text.toString(),
                  verificationCompleted: (_){},
                  verificationFailed: (e){
                  Utils().toastMethod(e.toString());
                  },

                  codeSent: (String verificationId , int? token){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>VerifyCodeScreen(verificationID: verificationId,)));
                  },
                  codeAutoRetrievalTimeout: (e){
                  Utils().toastMethod(e.toString());
                  });
            }),
          ),


        ],
      ),
    );
  }
}
