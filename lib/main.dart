import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:me_money/screens/main_screen.dart';
import 'package:me_money/widget/dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name, email, password;
  Container buildName() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6F35A5), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              Icons.fingerprint,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
              child: TextField(
            onChanged: (value) => name = value.trim(),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: 'Name...'),
          ))
        ],
      ),
    );
  }

  Container buildemail() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6F35A5), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              Icons.person,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: 'Email Address...'),
          ))
        ],
      ),
    );
  }

  Container buildpassword() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6F35A5), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              Icons.lock,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
              child: TextField(
            onChanged: (value) => password = value.trim(),
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: 'Password...'),
          ))
        ],
      ),
    );
  }

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFF6F35A5);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFF6F35A5);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Color(0xFF6F35A5);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Color(0xFF6F35A5);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Text(
                            "Login Connect",
                            style:
                                TextStyle(color: _headingColor, fontSize: 28),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "Me",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: _headingColor, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset("assets/images/Logo-1.1.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF6F35A5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => MainScreen()));
                //   },
                //   child: Container(
                //     margin: EdgeInsets.all(32),
                //     // padding: EdgeInsets.all(20),
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(50)),
                //     child: Center(
                //       child: OutlineBtn(
                //         btnText: "Go To Application",
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  buildemail(),
                  SizedBox(
                    height: 20,
                  ),
                  buildpassword(),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if ((email?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        normalDialog(context, 'กรุณากรอกข้อมูล!!');
                      } else {
                        checkLogin();
                      }
                    },
                    child: PrimaryButton(
                      btnText: "Login",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Create New Account",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back to Started",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  buildName(),
                  SizedBox(
                    height: 20,
                  ),
                  buildemail(),
                  SizedBox(
                    height: 20,
                  ),
                  buildpassword()
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print(
                          'name = $name, email = $email, password = $password');
                      if ((name?.isEmpty ?? true) ||
                          (email?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        print('Have Space');
                        normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ!!!');
                      } else {
                        print('No Space');
                        registerFirebase();
                      }
                    },
                    child: PrimaryButton(
                      btnText: "Create Account",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back To Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('-----Firebase connent-----');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print('Register Success');
        await value.user.updateProfile(displayName: name).then((value) =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainScreen())));
      });
    }).catchError((value) {
      normalDialog(context, value.message);
    });
  }

  Future<Null> checkLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainScreen())))
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF6F35A5), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF6F35A5), width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(color: Color(0xFF6F35A5), fontSize: 16),
        ),
      ),
    );
  }
}
