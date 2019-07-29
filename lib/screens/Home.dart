import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'announcementsPage.dart';
import 'calendar.dart';
import 'Marks.dart';
import 'Docs.dart';
import 'Message.dart';
import 'MyList.dart';
import 'Contacts.dart';
import 'package:moshal/nav_menu/feedback.dart';
import 'package:share/share.dart';
import 'package:moshal/nav_menu/settings.dart';
import 'dart:convert';
import 'Gallery.dart';
import '../api_service.dart';

class Dashboard extends StatefulWidget {
  static String tag = 'home-page';
  final String token;
  Dashboard(this.token);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String _token;
ApiService apiService;
  @override
  void initState() { 
    super.initState();
    _token = widget.token;
  
    Map<String, dynamic> map =parseJwt(_token); 
    apiService    =  new ApiService();

  //  debugPrint(map["id"]);
    
  }


  Map<String, dynamic> parseJwt(String token){
    final parts =token.split('.');

    if (parts.length != 3){
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);

    final payloadmap = json.decode(payload);
    if (payloadmap is! Map<String, dynamic>){
      throw Exception('invalid payload');
    }

    return payloadmap;
  }

  String _decodeBase64(String str){
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length %4) {
      case 0:
        break;

      case 2:
        output+= "==";
        break;
      case 3:
        output+= "=";
        break;
      default:
      throw Exception('illegal base 64 string');
    }
    
    return utf8.decode(base64Url.decode(output));
  }

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
  void shre(){
    final RenderBox box =context.findRenderObject();
    Share.share('smasol.co.za',
    sharePositionOrigin: 
      box.localToGlobal(Offset.zero) & box.size
    );
  }

  @override
  Widget build(BuildContext context) {

//    double full_width = MediaQuery.of(context).size.width*1.0;
Map<String, dynamic> map =parseJwt(_token);
String email = map["email"];
String name = map["name"] + " "+ map["surname"];
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountEmail: new Text('$email'),
              accountName: new Text('$name'),

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
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FeedbackPage()));
                }
            ),
            new ListTile(
                title: new Text("Settings"),
                trailing: new Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Settings()));
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
                  shre();
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
              // debugPrint(_token);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Marks()));
                              },
            child: myItems(Icons.format_list_numbered, "Marks Submission", 0xff01579b),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnnouncementPage(map["id"])));
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
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Gallery())
               );

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
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Contacts(map["university"])));
            },
            child: myItems(Icons.phone, "Contacts", 0xffd50000),
          ),

          InkWell(
            onTap:(){
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MyListPage()));
            },
            child: myItems(Icons.format_line_spacing, "Todo", 0xffe65100),
          ),

          InkWell(
            onTap:(){
              // perform action ontap
//              print("Contacts");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Messaging())
              );
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