import 'package:firebase_database/firebase_database.dart';


class PostService{
//  String nodeName = "Marks";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  Map post;

  PostService(this.post);

  addPost(String nodeName){
//    this is going to give a reference to the posts node
    database.reference().child(nodeName).push().set(post);
  }

//  deletePost(){
//    database.reference().child('$nodeName/${post['key']}').remove();
//  }

//  updatePost(){
//    database.reference().child('$nodeName/${post['key']}').update(
//        {"title": post['title'], "body": post['body'], "date":post['date']}
//    );
//  }
}