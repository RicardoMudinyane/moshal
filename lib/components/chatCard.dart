import 'package:flutter/material.dart';
import 'package:moshal/components/messageCard.dart';
import 'package:intl/intl.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:moshal/services/graphqldata.dart';

class ChatCard extends StatelessWidget {
  final String coordinator;
  final String lastUpdatedAt;
  final String chatId;

  const ChatCard({Key key, this.coordinator, this.lastUpdatedAt, this.chatId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff4a148c),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:Container(
      color: Color(0xff4a148c),
      padding: new EdgeInsets.only(left: 8.0),
      margin: const EdgeInsets.only(right: 10, top: 10, left: 5, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(left:8.0, top: 32, bottom: 32, right: 150),
            child:  Text(
            coordinator,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold,color: Colors.white) ,
          ),
          ),
          Container(
            child:Text(
              
            DateFormat('yyyy-MM-dd hh:mm').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(lastUpdatedAt) * 1000)),
            style: TextStyle(color: Colors.white),
          ) ,
          )
          
        ],
      ),
    ) ,
            ),
          ),
        ),   
    onTap: (){
      Navigator.pushNamed(
        context,
        ChatScreen.routeName,
        arguments: ChatArguments( chatId, coordinator)
    );
    
    },
  );
    
 
  }
}

class ChatArguments {
  final String chatId;
  final String coordinator; 
  ChatArguments(this.chatId, this.coordinator);
}

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat";
   GraphQLClient client;
   TextEditingController controller = TextEditingController();
   TextEditingController _controller = TextEditingController();

  initMethod(context){
    client = GraphQLProvider.of(context).value;
  }
   
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));
    final ChatArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.coordinator),
      ),


      
      body: Query(
         options: QueryOptions(document: getChatMessages(args.chatId), pollInterval: 1),
         builder: (QueryResult result, {VoidCallback refetch}){
            if (result.errors != null){
              print(result.errors.toString());
              return Text(result.errors.toString());
            }

            if (result.loading){
              return Text('loading');
            }
         //  print(result.data['getChatMessages']["messages"].length);

            return Container(
              margin: new EdgeInsets.only(bottom: 80, left: 5, right: 10),
              child: ListView.builder(
              
              itemCount: result.data['getChatMessages']["messages"].length,
              itemBuilder: (BuildContext context, int index){
                return MessageCard(
                  key: UniqueKey(),
                  body: result.data['getChatMessages']["messages"][index]['messageBody'],
                  to: result.data['getChatMessages']["messages"][index]['to'],
                  id: result.data['getChatMessages']["messages"][index]['id'],
                  date: result.data['getChatMessages']["messages"][index]['date'],
                );
              },
            ),
            );
            
          },
      )
    );
  }
}


/*
*/