import 'package:flutter/material.dart';

const String _name = "Ricardo";

class ChatMessage extends StatelessWidget {
  final String text;

  //for opotional params we use curly braces
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: MediaQuery.of(context).size.width*0.70,
                margin: const EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue, //                   <--- border color
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 100,
                  ),
                ),
              ),
//
            ],
          )
        ],
      ),
    );
  }
}
