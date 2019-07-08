import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'moshal_events.dart';

class Event extends StatefulWidget {


  @override
  EventState createState() {
    return new EventState();
  }
}

class EventState extends State<Event> {
  int _selectedTab = 0;
  Widget callPage(int currentIndex){

    switch(currentIndex){
      case 0: return Lost();
      case 1: return Escort();

      break;
      default:return Lost();
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(    
      onWillPop: (){
        moveToLastScreen();
      },
      child: Scaffold(
      appBar:  AppBar(title: Text("Calendar"), backgroundColor: Colors.redAccent,
      leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            moveToLastScreen();
        }),
      ),


      body:  callPage(_selectedTab),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,

        onTap: (value){
          _selectedTab = value;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Events'),

           ),

          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('Birthdays'),
          ),
        ],
    ),


    )
    );
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }

}