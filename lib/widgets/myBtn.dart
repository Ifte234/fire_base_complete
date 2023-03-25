import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String title;
  bool isloading;
  final VoidCallback onTap;
   MyButton({Key? key , required this.title ,required this.onTap , this.isloading = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(

          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.deepPurple,

          ),
          child: Center(child: isloading ==true ? CircularProgressIndicator(
            color: Colors.white,
          )
              :Text(title ,style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),),
    ),
        ),
      );
  }
}
