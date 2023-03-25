
import 'package:fire_base_complete/home_page.dart';
import 'package:fire_base_complete/ui/auth/signup_screen.dart';
import 'package:fire_base_complete/ui/post/post_screen.dart';
import 'package:fire_base_complete/utils/utils.dart';
import 'package:fire_base_complete/widgets/myBtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading = false ;

  final _auth =FirebaseAuth.instance;
 @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login(){
   setState(() {
     isloading= true;
   });
   _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
     Utils().toastMethod(value.user!.email.toString());
     Navigator.push(context, MaterialPageRoute(builder: (_)=>PostScreen()));

     setState(() {
       isloading =false;
     });
   }).onError((error, stackTrace){
     Utils().toastMethod(error.toString());
     setState(() {
       isloading = false;
     });
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Login Screen'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Form(
            key: _formKey,
            child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: 'Email...'
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Email can't be empty";

                }else{
                  return null;
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.password),
                  hintText: 'Password...',

              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Password can't be empty";
                }else{
                  return null;
                }
              },

            ),
        ],
      )

          ),
          SizedBox(height: 10,),
         MyButton(
           title: 'LOGIN',
           isloading: isloading,
           onTap: (){
             if(_formKey.currentState!.validate()){
               login();

             };
           },
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> SignUpScreen()));
              }, child: Text("SignUp"))
            ],
          )

        ],
      ),
    );
  }
}
