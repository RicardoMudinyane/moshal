import 'package:flutter/material.dart';
import 'package:moshal/utils/database.dart';
import 'viewAnnouncemnt.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:moshal/services/graphqldata.dart';
import '../components/messageCard.dart';
import '../components/chatCard.dart';


class AnnouncementPage extends StatefulWidget {

  final String _id;
  AnnouncementPage(this._id);
  @override
  AnnouncementPageState createState() => AnnouncementPageState();
}

class AnnouncementPageState extends State<AnnouncementPage> {

  String _id;

  @override
  void initState() { 
    super.initState();
    _id = widget._id;
    // Map<String, dynamic> map =parseJwt(_token);

  //  debugPrint(map["id"]);
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcements"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Query(
          options: QueryOptions(document: getStudentChats(_id), pollInterval: 1),
          builder: (QueryResult result, {VoidCallback refetch}){
            if (result.errors != null){
              return Text(result.errors.toString());
            }
            if (result.loading){
              return Text('loading');
            }
           

            return ListView.builder(
              itemCount: result.data['getStudentChats'].length,
              itemBuilder: (BuildContext context, int index){
                return ChatCard(
                  key: UniqueKey(),
                  coordinator: result.data['getStudentChats'][index]['coordinatorId']['name'],
                  lastUpdatedAt: result.data['getStudentChats'][index]['lastUpdated'],
                  chatId: result.data['getStudentChats'][index]['id'],
                );
              },
            );
          },
        ),
      ),
      

    );
  }

 

}