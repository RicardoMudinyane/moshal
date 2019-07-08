import 'package:moshal/utils/database.dart';
import 'package:moshal/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ViewAnn extends StatefulWidget {

  final Announce post;

  ViewAnn(this.post);

  @override
  _ViewAnnState createState() => _ViewAnnState();
}

class _ViewAnnState extends State<ViewAnn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    timeago.format(DateTime.fromMillisecondsSinceEpoch(widget.post.date)),
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.post.body),
          ),
        ],
      ),
    );
  }
}