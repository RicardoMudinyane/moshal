import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Docs extends StatefulWidget {

  @override
  DocsState createState() {
    return new DocsState();
  }
}
String _fileName = 'No File Selected';
class DocsState extends State<Docs> {


  String _path = '...';

  void _openFileExplorer() async {
    if (FileType.CUSTOM != FileType.CUSTOM || true) {

      try {
        _path = await FilePicker.getFilePath(type: FileType.CUSTOM, fileExtension: "pdf");
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
    }

    setState(() {
      _fileName = _path != null ? _path.split('/').last : '...';
    });

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text("Upload Documents"), backgroundColor: Colors.redAccent,),

        body:
        SingleChildScrollView(
          child: new Center(
              child: new Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0,),
                      child: new RaisedButton(
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        onPressed: () => _openFileExplorer(),
                        child: new Text("Choose File ..."),
                      ),
                    ),

                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        'File Name : ${_fileName}',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),


                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0,),
                      child: new RaisedButton(
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.blueGrey,

                        onPressed: () {
                          sendFIle();
                          // Perform some action
                        },

                        child: new Text("Send"),
                      ),
                    ),
//                    new Text(
//                      _fileName,
//                      textAlign: TextAlign.center,
//                    ),
                  ],

                ),
              )),

        ),


    );
  }

  void sendFIle() async {

//    final StorageReference storageRef = FirebaseStorage.instance.ref().child(_fileName);
//    final StorageUploadTask uploadTask = storageRef.putFile( File(_path), StorageMetadata(contentType: 'Files' + '/' + 'pdf',),);
//    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
//    final String url = (await downloadUrl.ref.getDownloadURL());
//    print('URL Is $url');

  }


}