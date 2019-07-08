import 'package:flutter/material.dart';
import 'package:moshal/utils/PostService.dart';
import '../utils/database.dart';

class Marks extends StatefulWidget {
  Marks({Key key}) : super(key: key);

  @override
  MarksState createState() => MarksState();
}

class MarksState extends State<Marks> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Mark mark = Mark("test", " ", " ", "", " ");
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            title: new Text("Marks Submission"),
            backgroundColor: Colors.redAccent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          resizeToAvoidBottomPadding: true,
          body: Form(
            key: formkey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
                  child: new ListTile(
                    title: new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Course Code',
                          hintText: 'COMS 3007',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      onSaved: (val) => mark.course_code = val,
                      validator: (val){
                        if(val.isEmpty){
                          return "Course Code field cant be empty";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                  child: new ListTile(
                    title: new TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Module Name',
                          hintText: 'Machine Learning',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      onSaved: (val) => mark.module_name = val,
                      validator: (val){
                        if(val.isEmpty){
                          return "Module Name field cant be empty";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                  child: new ListTile(
                    title: new TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Test 1',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      onSaved: (val) => mark.description = val,
                      validator: (val){
                        if(val.isEmpty){
                          return "Decription field cant be empty";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                  child: new ListTile(
                    title: new TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Marks',
                          hintText: '100%',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      onSaved: (val) => mark.marks = val,
                      validator: (val){
                        if(val.isEmpty){
                          return "Marks field cant be empty";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
                  child: new ListTile(
                    title: new TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Test Date',
                          hintText: '17/02/2017',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      onSaved: (val) => mark.description = val,
                      validator: (val){
                        if(val.isEmpty){
                          return "Date field cant be empty";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                  child: new ListTile(
                    title: new RaisedButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      color: Theme.of(context).accentColor,
                      elevation: 8.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.blueGrey,
                      onPressed: () {
                        submitMark();
                        // Perform some action
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  void submitMark() {
    final FormState form = formkey.currentState;

    if(form.validate()) {
      form.save();
      form.reset();
      PostService postService = PostService(mark.toJson());
      postService.addPost("Marks/-user1/");
    }
    showInSnackBar("Marks Submitted");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(content:
        new Text(value,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        ),
    );
  }


}
