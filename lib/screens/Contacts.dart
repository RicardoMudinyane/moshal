import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_color/random_color.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'dart:async';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() {
    return new ContactsState();
  }
}

class ContactsState extends State<Contacts> {
  Widget appBarTitle = new Text(
    "Contacts",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
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
    _list.add(
        "Ricardo Mudinyane 077228754 test@gmail.com https://media.wired.com/photos/5b86fce8900cb57bbfd1e7ee/master/pass/Jaguar_I-PACE_S_Indus-Silver_065.jpg");
    _list.add("Sithole Thulani 0855454584 test2@gmail.com ");
    _list.add("Kat Mphuthi 0647512454 kat@gmail.com ");
    _list.add("Muthu Munwe 06556456124 munwe@gmail.com ");
    _list.add("Brendan Rovholo 0722897821 bre@gmail.com ");
    _list.add("Example Ricky 072567515 ric@gmail.com ");
    _list.add("Echo Murphy 0720854765 murphy@gmail.com ");
    _list.add("Abby Bellemy 0735655455 abby@bel.com ");
  }

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
                      child: searchresult.length != 0 ||
                          _controller.text.isNotEmpty
                          ? new ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchresult.length,
                        itemBuilder: (BuildContext context, int index) {
//              String listData = searchresult[index];
                          RandomColor _randomC = RandomColor();
                          Color _color = _randomC.randomColor(
                              colorBrightness: ColorBrightness.light);
                          var perInfo = searchresult[index].split(" ");
                          String name = perInfo[0] + " " + perInfo[1];
                          String image = perInfo[4];
                          String email = perInfo[3];
                          String cellnumber = perInfo[2];
                          var nameInit = name[0].toUpperCase();
                          if (image.length > 0) {
                            nameInit = "";
                          }
                          Future trying() async {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    InfoCard(
                                      name: name,
                                      phone: cellnumber,
                                      email: email,
                                      image: image,
                                      colorIm: _color,
                                      imageLetter: nameInit,
                                    ));
                          }

                          return new ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _color,
                              backgroundImage: NetworkImage(image),
                              foregroundColor: Colors.black,
                              radius: 25.0,
                              child: Text(
                                nameInit,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            title: Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                              colorBrightness: ColorBrightness.light);
                          var perInfo = _list[index].split(" ");
                          String name = perInfo[0] + " " + perInfo[1];

                          String cellnumber = perInfo[2];
                          String image = perInfo[4];
                          String email = perInfo[3];
                          var nameInit = name[0].toUpperCase();
                          if (image.length > 0) {
                            nameInit = "";
                          }
                          Future trying() async {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    InfoCard(
                                      name: name,
                                      phone: cellnumber,
                                      email: email,
                                      image: image,
                                      colorIm: _color,
                                      imageLetter: nameInit,
                                    ));
                          }

                          return new ListTile(
                              leading: CircleAvatar(
                                backgroundColor: _color,
                                backgroundImage: NetworkImage(image),
                                foregroundColor: Colors.black,
                                radius: 25.0,
                                child: Text(
                                  nameInit,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                              title: Text(name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              subtitle: Text(cellnumber),
                              onTap: trying);
                        },
                      ))
                ])));
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

class InfoCard extends StatelessWidget {
  final String name, phone, email, image, imageLetter;
  final Color colorIm;

  InfoCard({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.image,
    @required this.colorIm,
    @required this.imageLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContext(context),
    );
  }

  dialogContext(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(
            top: Consts.avatarRadius,
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(
                Consts.padding,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {
                  UrlLauncher.launch("mailto:${email}");
                },
                child: new RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: "Email: ",style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: email,
                        style: TextStyle(
                            fontSize: 17.0,
                            decoration: TextDecoration.underline,
                            color: Colors.lightBlue),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),


              InkWell(
                onTap: () {
                  UrlLauncher.launch("tel:${phone}");
                },
                child: new RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text: "Phone: ",style: TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: phone,
                        style: TextStyle(
                            fontSize: 17.0,
                            decoration: TextDecoration.underline,
                            color: Colors.lightBlue),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Okay"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            backgroundColor: colorIm,
            backgroundImage: NetworkImage(image),
            foregroundColor: Colors.black,
            radius: Consts.avatarRadius,
            child: Text(
              imageLetter,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
        )
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 10.0;
  static const double avatarRadius = 45.0;
}
