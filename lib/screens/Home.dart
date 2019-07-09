import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'announcementsPage.dart';
import 'calendar.dart';
import 'Marks.dart';
import 'Docs.dart';
// import 'gallery.dart';
// import 'contacts.dart';
// import 'events_calendar.dart';
// import 'chat_box.dart';
// import 'todoList.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Material myItems (IconData icon, String heading, int color){

    return Material (
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Colors.teal,

      borderRadius: BorderRadius.circular(24.0),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading,
                        style: TextStyle(color:
                        new Color(color),
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold)),
                  ),

                  // Icon
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ),
                  ),

                ],
              ),


              ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

//    double full_width = MediaQuery.of(context).size.width*1.0;

    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountEmail: new Text("1355115@students.wits.ac.za"),
              accountName: new Text("Ricardo Mudinyane"),

              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(''),
                ),
                onTap: () => print("This is your current account."),
              ),
            ),

            new ListTile(
                title: new Text("Personal Details"),
                trailing: new Icon(Icons.account_circle),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("My Profile")));
                }
            ),
            new ListTile(
                title: new Text("Feedback"),
                trailing: new Icon(Icons.feedback),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Feedback")));
                }
            ),
            new ListTile(
                title: new Text("Settings"),
                trailing: new Icon(Icons.info),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Settings")));
                }
            ),
            new ListTile(
                title: new Text("About"),
                trailing: new Icon(Icons.info),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("About Page")));
                }
            ),
            new ListTile(
                title: new Text("Share"),
                trailing: new Icon(Icons.share),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Share")));
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Log-out"),
              trailing: new Icon(Icons.power_settings_new),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body:

      StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

        children: <Widget>[

          InkWell(
            onTap:(){
              // perform action ontap
//              print("Marks Submission");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Marks()));
            },
            child: myItems(Icons.format_list_numbered, "Marks Submission", 0xff01579b),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnnouncementPage()));
            },
            child: myItems(Icons.list, "Announcements", 0xff4a148c),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
//              print("Upload Documents");
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Docs())
               );
            },
            child: myItems(Icons.cloud_upload, "Upload Documents", 0xff1a237e),
          ),

          InkWell(
            onTap:(){
//               perform action ontap
//              print("Calendar");
                             Navigator.push(context,
                   MaterialPageRoute(builder: (context) => CalendarViewApp())
               );

            },
            child: myItems(Icons.event, "Calendar", 0xff0d47a1),

          ),

          InkWell(
            onTap:(){
              // perform action ontap
              print("Gallery");
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Gallery())
              // );

            },
            child: myItems(Icons.photo, "Gallery", 0xff1b5e20),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
              print("Buddy System");
            },
            child: myItems(Icons.people, "Buddy System", 0xffc51162),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
//              print("Contacts");
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Contacts())
              // );
            },
            child: myItems(Icons.phone, "Contacts", 0xffd50000),
          ),

          InkWell(
            onTap:(){
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Todo()));
            },
            child: myItems(Icons.format_line_spacing, "Todo", 0xffe65100),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
//              print("Contacts");

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Messaging()) );
            },
            child: myItems(Icons.chat, "Message", 0xff004d40),
          ),


        ],
        staggeredTiles:[
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1 ,130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.count(1, 1.45),
          StaggeredTile.extent(1, 130.0),

        ],
      ),

    );
  }

}