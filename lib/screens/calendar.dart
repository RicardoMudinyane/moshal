import 'package:flutter/material.dart';
import 'dart:async';
import 'package:calendar_view_widget/calendar_view_widget.dart';

class CalendarViewApp extends StatefulWidget {

  @override
  CalendarViewAppState createState() => new CalendarViewAppState();
}

class CalendarViewAppState extends State<CalendarViewApp> {

  StreamController<List<Map<String, String>>> eventsController =
  new StreamController();

  @override
  void dispose() {
    eventsController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const eventList = [


      {
        'name': 'Event (null test)',
        'location': null,
        'date': '2018-09-27 13:27:00',
        'id': '1',
      },


      {
        'name': null,
        'location': 'Suite 501',
        'date': '2018-09-21 14:35:00',
        'id': '2',
      },


      {
        'name': 'Event null date',
        'location': '1200 Park Avenue',
        'date': null,
        'id': '3',
      },

      {
        'name': 'Event null id',
        'location': 'Grand Ballroom',
        'date': '2018-08-27 13:27:00',
        'id': null,
      },
      {
        'name': 'Event 4',
        'location': 'Grand Ballroom',
        'date': '2018-08-27 13:27:00',
        'id': '4',
      },
      {
        'name': 'Event 5',
        'location': 'Suite 501',
        'date': '2018-10-21 14:35:00z',
        'id': '5',
      },
      {
        'name': 'Event 6',
        'location': '1200 Park Avenue',
        'date': '2018-08-22 05:49:00',
        'id': '6',
      },
      {
        'name':
        'Handle really long names in the event list so it does not break',
        'location': '1200 Park Avenue',
        'date': '2018-10-24 05:49:00',
        'id': '7',
      },
      {
        'name': 'Event 8',
        'location':
        'Handle really long locations in the event list so it does not break',
        'date': '2018-10-24 05:49:00z',
        'id': '8',
      },
    ];

    final theme = ThemeData.dark().copyWith(
      primaryColor: Colors.cyan,
      accentColor: Colors.indigo,
      canvasColor: Colors.white,
      backgroundColor: Colors.lightBlue,
      dividerColor: Colors.blueGrey,
      textTheme: ThemeData.dark().textTheme.copyWith(
        display1: TextStyle(
          fontSize: 21.0,
        ),
        subhead: TextStyle(
          fontSize: 14.0,
          color: Colors.blueGrey,
        ),
        headline: TextStyle(
          fontSize: 18.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        title: TextStyle(
          fontSize: 14.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
      accentTextTheme: ThemeData.dark().accentTextTheme.copyWith(
        body1: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        title: TextStyle(
          fontSize: 21.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        display1: TextStyle(
          fontSize: 21.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    void onEventTapped(Map<String, String> event) {
      print(event);
    }

    eventsController.add(eventList);

    return new Scaffold(
      appBar: new AppBar(

        title: new Text("Calendar"),
      ),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            new CalendarView(
              onEventTapped: onEventTapped,
              titleField: 'name',
              detailField: 'location',
              dateField: 'date',
              separatorTitle: 'Events',
              theme: theme,
              eventStream: eventsController.stream,
            ),
          ],
        ),
      ),
    );
  }
}