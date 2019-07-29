import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:intl/intl.dart';


class MessageCard extends StatelessWidget {
  final String body;
  final String to;
  final String id;
  final String date;

  const MessageCard({Key key, this.body, this.date, this.to, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: InkWell(
      onTap: () {
        print('Message ID: ${id}');
      },
      child: Container(
        color: Colors.grey,
        padding: new EdgeInsets.only(left: 10, top: 20, bottom:10, right: 10),
        margin: new EdgeInsets.only(left: 0, bottom: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: SingleChildScrollView(
                child: Html(
                  data: body,
                  padding: EdgeInsets.all(8.0),
                  useRichText:true,
                  showImages: true,
                ),
                
              ) 
              ),
            // Container(
            //   padding: new EdgeInsets.only(left: 100),
            //   child: Text(
            //     DateFormat('yyyy-MM-dd hh:mm').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(date) * 1000))
            //   ),
            // )
          ],
        ),
      ),
    )
    );
  }
  String sliceMessage(String message){

  }
}