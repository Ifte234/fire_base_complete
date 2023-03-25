
import 'package:fire_base_complete/home_page.dart';
import 'package:fire_base_complete/ui/auth/signup_screen.dart';
import 'package:fire_base_complete/widgets/myBtn.dart';
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

 @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
           onTap: (){
             if(_formKey.currentState!.validate()){
               Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage()));

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
