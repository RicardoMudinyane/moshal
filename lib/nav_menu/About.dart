import 'package:flutter/material.dart';
import '../screens/MoshalSite.dart';
import 'theApp.dart';
import 'theFounder.dart';
import 'theProgram.dart';
import 'dart:async';

class About extends StatefulWidget {
  About({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: ListView(
          // This next line does the trick.
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              bottom: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
            ),
            children: <Widget>[
              new GestureDetector(
                child: Card(
                  elevation: 4,
                  color: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://moshalscholarship.org/wp-content/uploads/2018/10/7J6A7727.jpg"),
                              foregroundColor: Colors.black,
                              radius: 60.0,
                            ),
                            SizedBox(height: 10,),
                            Text("The Program", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ],
                        ),
                      )),
                ),
                onTap: program,

              ),
              new GestureDetector(
                child: Card(
                  elevation: 4,
                  color: Colors.purple[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://moshalscholarship.org/wp-content/uploads/2018/07/1.jpg"),
                              foregroundColor: Colors.black,
                              radius: 60.0,
                            ),
                            SizedBox(height: 10,),
                            Text("The Founder", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ],
                        ),
                      )),
                ),
                onTap: founder,

              ),
              new GestureDetector(
                child: Card(
                  elevation: 4,
                  color: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://moshalscholarship.org/wp-content/uploads/2018/07/184A75641-750x500.jpg"),
                              foregroundColor: Colors.black,
                              radius: 60.0,
                            ),
                            SizedBox(height: 10,),
                            Text("The App", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ],
                        ),
                      )),
                ),
                onTap: app,

              ),
              new GestureDetector(
                child: Card(
                  elevation: 4,
                  color: Colors.red[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFtpVuC5kMRE4H5kmBt6oAe0eWIKqk2qBT60l_i5YEE6EGaAhg"),
                              foregroundColor: Colors.black,
                              radius: 60.0,
                            ),
                            SizedBox(height: 10,),
                            Text("Open Website", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ],
                        ),
                      )),
                ),
                onTap: openSite
              ),

            ]),
      ),
    );
  }
  Future openSite() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MoshalSite())
    );
  }

  Future founder() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TheFounder())
    );
  }

  Future app() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TheApp())
    );
  }

  Future program() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TheProgram())
    );
  }
}
