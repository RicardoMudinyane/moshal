import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moshal/style/theme.dart' as Theme;
import 'package:moshal/screens/Home.dart';
import 'Register.dart';
import 'dart:async';
import '../api_service.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}
//final FirebaseAuth mAuth = FirebaseAuth.instance;

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String email, password;
  String returned_message = "";
  Color message_color;

  ApiService apiService;
  @override
  void initState(){
    super.initState();
    apiService = new ApiService();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
    
  }

  @override
  void dispose(){
    _pageController?.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _obscureTextLogin = true;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 23.0),

            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 75.0),
                    child: new Image(
                      width: 200.0,
                      height: 190.0,
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/img/login_logo.png'),
                    ),
                  ),
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
                          height: 190.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    left: 25.0,
                                    right: 25.0),
                                child: TextField(
                                  // focusNode: myFocusNodeEmailLogin,
                                  // controller: loginEmailController,
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
                                      size: 22.0,
                                    ),
                                    hintText: "Email Address",
                                    hintStyle: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 17.0),
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
                                  obscureText: _obscureTextLogin,
                                  style: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.lock,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontFamily: "WorkSansSemiBold",
                                        fontSize: 17.0),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleLogin,
                                      child: Icon(
                                        _obscureTextLogin
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
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 170.0),
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
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontFamily: "WorkSansBold"),
                            ),
                          ),
                          onPressed: () => {
                            _signIn(),
                            showSnackBar(returned_message, message_color)
                            }
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.cyan,
                              fontSize: 16.0,
                              fontFamily: "WorkSansMedium"),
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: FlatButton(

                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "WorkSansMedium"),
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: Text(
                          "Register Here",
                          style: TextStyle(
                              color: Colors.cyan,
                              decoration: TextDecoration.underline,
                              fontSize: 17.0,
                              fontFamily: "WorkSansMedium"),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  void _signIn(){

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

    apiService.loginUser(email, password).then((Map<dynamic, dynamic> res){
      
      if (res["code"] == 200){

        returned_message = "Login Successfully";
        message_color = Colors.green;
        Navigator.pop(context);
          Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard(res["token"])));
      }else{
        returned_message = "Email or password is incorrect";
        message_color = Colors.red;
          Navigator.pop(context);
          debugPrint("Email or password is incorrect");
      }

    });
    
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void showSnackBar(String value, Color colors){

    _scaffoldKey.currentState.showSnackBar(
          new SnackBar(
            content: Text(value, style:TextStyle(
              color: colors,
              fontWeight:FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
          )
        );
  }

}
