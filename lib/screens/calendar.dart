// import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter/material.dart';

class CalendarViewApp extends StatefulWidget {

  @override
  CalendarViewAppState createState() {
    return new CalendarViewAppState();
  }
}

class CalendarViewAppState extends State<CalendarViewApp> {
  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  String event_name = "No Upcoming event for the selected date";
  void eventDate( DateTime date){

    setState(() {
      event_name =  date.day.toString() +"/" + date.month.toString() +"/"+ date.year.toString();

    });

  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
      },

      child : Scaffold(
        appBar: new AppBar(
          title: new Text("Calendar"),
          backgroundColor: Colors.redAccent,
          leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              }),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: new ListView(

            shrinkWrap: true,
            children: <Widget>[



              new Divider(
                height: 50.0,
              ),

              new Container(
                color: Color.fromARGB(255, 66, 165, 245),
                alignment: AlignmentDirectional(0.0, 0.0),

                child: Container(
                  color: Colors.lightBlue,
                  margin: new EdgeInsets.symmetric(
                      vertical: 70.0,
                      horizontal: 40.0
                  ),

                  child: Text(event_name, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),



            ],
          ),
        ),

      )),
    );

  }

}