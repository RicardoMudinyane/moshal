import 'package:flutter/material.dart';
import 'dart:async';
import 'package:calendar_view_widget/calendar_view_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:moshal/services/graphqldata.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

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

    // eventsController.add(eventList);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calendar"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Query(
              options: QueryOptions(
                  document: getStudentsContacts("wits"), pollInterval: 10000),
              builder: (QueryResult result, {VoidCallback refetch}) {
                if (result.errors != null) {
                  return Text(result.errors.toString());
                }
                if (result.loading) {
                  return Text(
                    'loading',
                    textAlign: TextAlign.center,
                  );
                }
                List<Map<String, String>> eList = [];

                int count = result.data['getStudentsContacts'].length;
                String thisYear =DateTime.now().year.toString();

                for (int i = 0; i < count; i++) {
                  String name = result.data['getStudentsContacts'][i]['name'];
                  String surname =
                      result.data['getStudentsContacts'][i]['surname'];
                      DateTime dobDate = DateTime.fromMicrosecondsSinceEpoch(int.parse(result.data['getStudentsContacts'][i]['dob'])*1000);
                      // DateTime newDate = new Da
                  String dob =DateFormat('yyyy-MM-dd').format(dobDate);
                  dob = thisYear + dob.substring(4, dob.length);
                  debugPrint(dob);
                   Map<String, String> event = {
                    'name': name+ " " + surname,
                  'location': 'Birthday',
                  'date': dob, 
                  'id': '5', 
                  };

                  eList.add(event);
                }
        
                eventsController.add(eList);

                return new CalendarView(
                  onEventTapped: onEventTapped,
                  titleField: 'name',
                  detailField: 'location',
                  dateField: 'date',
                  separatorTitle: 'Events & Birthdays',
                  theme: theme,
                  eventStream: eventsController.stream,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
