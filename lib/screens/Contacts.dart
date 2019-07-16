import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';

class Contacts extends StatefulWidget {

  @override
  ContactsState createState() {
    return new ContactsState();
  }
}

class ContactsState extends State<Contacts> {

  Widget appBarTitle = new Text("Contacts",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List <dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  _SearchListExampleState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add("Indian rupee 077228754 https://media.wired.com/photos/5b86fce8900cb57bbfd1e7ee/master/pass/Jaguar_I-PACE_S_Indus-Silver_065.jpg");
    _list.add("United States 85545458754 ");
    _list.add("Australian dollar 847512454 ");
    _list.add("Euro TRy 5556456124 ");
    _list.add("British pound 0722897821 ");
    _list.add("Yemeni rial 02567515 ");
    _list.add("Japanese yen 020854765 ");
    _list.add("Hong Kong 82005655455 ");
  }

//  Widget _contactList (String name, String image, String cellnumber){
//
//    RandomColor _randomC = RandomColor();
//    Color _color = _randomC.randomColor(
//      colorBrightness: ColorBrightness.light
//    );
//
//    var nameInit  = name[0].toUpperCase();
//    if (image.length > 0){
//      nameInit = "";
//    }
//    return Padding(
//      padding: const EdgeInsets.only(top:8.0),
//      child: ListTile(
//        leading: CircleAvatar(
//          backgroundColor: _color,
//          backgroundImage: NetworkImage(image),
//          foregroundColor: Colors.black,
//          radius: 25.0,
//          child: Text(nameInit,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
//        ),
//        title: Text(name),
//        subtitle: Text(cellnumber),
//      ),
//    );
//
//
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      appBar: buildAppBar(context),
      body: new Container(
    child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Flexible(
          child: searchresult.length != 0 || _controller.text.isNotEmpty
              ? new ListView.builder(
            shrinkWrap: true,
            itemCount: searchresult.length,
            itemBuilder: (BuildContext context, int index) {
//              String listData = searchresult[index];
              RandomColor _randomC = RandomColor();
              Color _color = _randomC.randomColor(
                  colorBrightness: ColorBrightness.light
              );
              var perInfo = searchresult[index].split(" ");
              String name = perInfo[0]+" "+perInfo[1];
              String image = perInfo[3];
              String cellnumber = perInfo[2];
              var nameInit  = name[0].toUpperCase();
              if (image.length > 0){
                nameInit = "";
              }
              return new ListTile(
                leading: CircleAvatar(
                  backgroundColor: _color,
                  backgroundImage: NetworkImage(image),
                  foregroundColor: Colors.black,
                  radius: 25.0,
                  child: Text(nameInit,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                title: Text(name, style:TextStyle(fontWeight: FontWeight.bold,) ,),
                subtitle: Text(cellnumber),
              );
            },
          )
              : new ListView.builder(
            shrinkWrap: true,
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index) {
//              String listData = _list[index];
              RandomColor _randomC = RandomColor();
              Color _color = _randomC.randomColor(
                  colorBrightness: ColorBrightness.light
              );
              var perInfo = _list[index].split(" ");
              String name = perInfo[0]+" "+perInfo[1];

              String cellnumber = perInfo[2];
              String image = perInfo[3];
              var nameInit  = name[0].toUpperCase();
              if (image.length > 0){
                nameInit = "";
              }
              return new ListTile(
                leading: CircleAvatar(
                  backgroundColor: _color,
                  backgroundImage: NetworkImage(image),
                  foregroundColor: Colors.black,
                  radius: 25.0,
                  child: Text(nameInit,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
                title: Text(name, style:TextStyle(fontWeight: FontWeight.bold,)),
                subtitle: Text(cellnumber),
              );
            },
          ))
      ]
    )
      )
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Contacts",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}