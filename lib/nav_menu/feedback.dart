import 'package:flutter/material.dart';
// import 'db/PostService.dart';
// import 'post.dart';

class FeedbackPage extends StatefulWidget {
  static String tag = 'feedback-page';
  @override
  _FeedbackPageState createState() => new _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> formkey = new GlobalKey();
 // Feed feed = Feed("");


  @override
  Widget build(BuildContext context) {

    // void insertPost() {
    //   final FormState form = formkey.currentState;
    //   if(form.validate()) {
    //     form.save();
    //     form.reset();
    //     PostService postService = PostService(feed.toJson());
    //     postService.addPost("Feedback/");
    //   }
    // }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body:

          Form(
              key: formkey,
              child: Container(
            child:SingleChildScrollView(
                child: Column(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(13.0),
                        child: Text("Your feedback is important to us. Please send us your comment, queries or concerns by sending a message below",
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                      ),

                      Divider(
                        height: 12.0,
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
                        height: 140,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 20,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                            ),
                            hintText: "Type something ...",
                          ),
                          // onSaved: (val) => feed.feedback = val,
                          validator: (val){
                            if(val.isEmpty){
                              return "Decription field cant be empty";
                            }
                          },
                        ),
                      ),

                      ButtonTheme(
                        height: 45.0,
                        child: RaisedButton(

                          child: const Text('Send Feedback'),
                          color: Theme.of(context).accentColor,
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            // insertPost();
                          },
                        ),
                      ),

                    ]

                )

            ),
          ),
          ),
    );


  }
}