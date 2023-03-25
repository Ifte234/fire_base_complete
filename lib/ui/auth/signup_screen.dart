
import 'package:fire_base_complete/home_page.dart';
import 'package:fire_base_complete/ui/auth/login_screen.dart';
import 'package:fire_base_complete/utils/utils.dart';
import 'package:fire_base_complete/widgets/myBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading =false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup(){
    setState(() {
      isloading =true;
    });
    // Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage()));

    _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
      setState(() {
        isloading =false;
      });
      print('Account created');
    }).onError((error, stackTrace){
      print('Error');
      Utils().toastMethod(error.toString());
      setState(() {
        isloading =false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('SignUp Screen'),
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
              isloading: isloading,
              title: 'SIGN UP',
              onTap: (){
                if(_formKey.currentState!.validate()){
                signup();
                };
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen()));
                }, child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
