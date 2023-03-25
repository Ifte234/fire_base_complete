import 'package:fire_base_complete/utils/utils.dart';
import 'package:fire_base_complete/widgets/myBtn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postController = TextEditingController();
  bool isloading = false ;
  final databaseref = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post'),),
    body: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            controller: postController,
            maxLines: 4,
            decoration: InputDecoration(

              border: OutlineInputBorder(),
              hintText: 'What is in your mind?'
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        MyButton(title: 'ADD',
            isloading : isloading,
            onTap: (){
          setState(() {
            isloading = true;
          });
          databaseref.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
            'title' : postController.text.toString(),
            'id' : DateTime.now().microsecondsSinceEpoch.toString()
          }).then((value) {
            setState(() {
              isloading = false;
            });
            Utils().toastMethod('Post added');
          }).onError((error, stackTrace){
            setState(() {
              isloading=false;
            });
            Utils().toastMethod(error.toString());
          });

        })
      ],
    ),);
  }
}
