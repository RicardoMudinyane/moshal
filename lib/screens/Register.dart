import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moshal/style/theme.dart' as Theme;
import 'package:moshal/utils/bubble_indication_painter.dart';
import 'package:moshal/screens/Log_Reg.dart';
import 'dart:async';
import '../api_service.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  RegisterState createState() => new RegisterState();
}
//final FirebaseAuth mAuth = FirebaseAuth.instance;

class RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;
  String returned_message = "";
  Color message_color;

  ApiService apiService;
  String name, surname, email, cellnumber;
  String dob, degree, yos, password;

  @override
  void initState() {
    super.initState();
    apiService = new ApiService();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // TextEditingController email = new TextEditingController();
  TextEditingController _cPass = new TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;
  String university = 'University';
  String gender = 'Gender';
  String faculty = 'Faculty';

  String _value = 'Date Of Birth';
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    _value = selectedDate.year.toString() +
        "-" +
        selectedDate.month.toString() +
        "-" +
        selectedDate.day.toString();
    dob = _value;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              padding: EdgeInsets.only(top: 23.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: 320.0,
                          height: 600.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // focusNode: myFocusNodeName,
                                    // controller: signupNameController,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.black,
                                      ),
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => name = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // focusNode: myFocusNodeName,
                                    // controller: signupNameController,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.black,
                                      ),
                                      hintText: "Surname",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => surname = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                      ),
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => email = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupNameController,
                                    keyboardType: TextInputType.number,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.phone,
                                        color: Colors.black,
                                      ),
                                      hintText: "Contact",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => cellnumber = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 18.0,
                                      bottom: 18.0,
                                      left: 25.0,
                                      right: 38.0),
                                  child: Container(
                                    width: 320.0,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                      ),
                                      value: gender,
                                      onChanged: (String newVar) {
                                        setState(() {
                                          gender = newVar;
                                        });
                                      },
                                      items: <String>[
                                        'Gender',
                                        'Male',
                                        'Female',
                                        'Prefer not saying'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            children: <Widget>[
                                              new Image(
                                                  width: 29.0,
                                                  height: 29.0,
                                                  fit: BoxFit.fill,
                                                  image: new AssetImage(
                                                      'assets/img/fmg.png')),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "WorkSansSemiBold",
                                                      fontSize: 16.0,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                        left: 25.0,
                                        right: 25.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.birthdayCake,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          child: new Text(
                                            _value,
                                            style: TextStyle(
                                                fontFamily: "WorkSansSemiBold",
                                                fontSize: 16.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 18.0,
                                      bottom: 18.0,
                                      left: 25.0,
                                      right: 38.0),
                                  child: Container(
                                    width: 320.0,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                      ),
                                      value: university,
                                      onChanged: (String newVar) {
                                        setState(() {
                                          university = newVar;
                                        });
                                      },
                                      items: <String>[
                                        'University',
                                        'Wits',
                                        'UCT',
                                        'UP',
                                        'NMU',
                                        'Stellenbosch',
                                        'UKZN'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.account_balance,
                                                size: 29.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "WorkSansSemiBold",
                                                      fontSize: 16.0,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupNameController,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.graduationCap,
                                        color: Colors.black,
                                      ),
                                      hintText: "Degree Name",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => degree = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 18.0,
                                      bottom: 18.0,
                                      left: 25.0,
                                      right: 38.0),
                                  child: Container(
                                    width: 320.0,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                      ),
                                      value: faculty,
                                      onChanged: (String newVar) {
                                        setState(() {
                                          // Icon(FontAwesomeIcons.layerGroup, size: 29.0,);
                                          faculty = newVar;
                                        });
                                      },
                                      items: <String>[
                                        'Faculty',
                                        'Science',
                                        'Engineering',
                                        'Health Care',
                                        'Law',
                                        'Humanity'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.layerGroup,
                                                size: 29.0,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "WorkSansSemiBold",
                                                      fontSize: 16.0,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupNameController,
                                    keyboardType: TextInputType.number,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.list,
                                        color: Colors.black,
                                      ),
                                      hintText: "Year of study",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                    ),
                                    onChanged: (val) => yos = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupPasswordController,
                                    obscureText: _obscureTextSignup,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.black,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignup,
                                        child: Icon(
                                          _obscureTextSignup
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onChanged: (val) => password = val,
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 25.0,
                                      right: 25.0),
                                  child: TextField(
                                    // controller: signupConfirmPasswordController,
                                    obscureText: _obscureTextSignupConfirm,
                                    style: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.black,
                                      ),
                                      hintText: "Confirmation",
                                      hintStyle: TextStyle(
                                          fontFamily: "WorkSansSemiBold",
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignupConfirm,
                                        child: Icon(
                                          _obscureTextSignupConfirm
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 590.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Theme.Colors.loginGradientStart,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 20.0,
                            ),
                            BoxShadow(
                              color: Theme.Colors.loginGradientEnd,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 20.0,
                            ),
                          ],
                          gradient: new LinearGradient(
                              colors: [
                                Theme.Colors.loginGradientEnd,
                                Theme.Colors.loginGradientStart
                              ],
                              begin: const FractionalOffset(0.2, 0.2),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Theme.Colors.loginGradientEnd,
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 42.0),
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontFamily: "WorkSansBold"),
                              ),
                            ),
                            onPressed: () => signUp()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  void signUp() {

    showDialog(
      context: context,
      barrierDismissible: true,
      child: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: new Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0) ),
        child: Container(
          height: 100.0 ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 15.0,
              ),
              Text("Loading...")
            ],
          ),
        )
      ),
      )
    );

    debugPrint(" $name , $faculty , $dob , $cellnumber");
    apiService
        .registerUser(
            name,
            surname,
            email,
            gender.toLowerCase(),
            dob,
            university.toLowerCase(),
            faculty.toLowerCase(),
            degree,
            yos,
            cellnumber,
            password)
        .then((Response response) {
      debugPrint("SOMETHING ${response.code}");
      if (response.code == 200){
        
        returned_message = "Registration Successfully";
        message_color = Colors.green;

        Navigator.pop(context);
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
      }else if (response.code == 404){

        returned_message = "Registration failed";
        message_color = Colors.red;
        Navigator.pop(context);
        debugPrint(response.toString());
      }
          })
    .catchError((e){
      print("${e.error}");
       Navigator.pop(context);
      final message = e is MyHttpException ? e.message : "Something something";
      debugPrint(message);
    })
    ;
  }

  void showSnackBar(String value, Color colors){

    _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: Text(value, style:TextStyle(
              color: colors,
              fontWeight:FontWeight.bold
            ),
            textAlign: TextAlign.center,
            ),
          )
        );
  }
}
