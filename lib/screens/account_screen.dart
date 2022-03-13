// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String displayName, displayEmail;

  @override
  void initState() {
    super.initState();
    fingDisplayName();
  }

  Future<Null> fingDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          displayName = event.displayName;
          displayEmail = event.email;
        });
        print('displayname = $displayName');
        print('displayemail = $displayEmail');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            displayName == null ? 'Non ?' : displayName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Prompt'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            displayEmail == null ? 'Non ?' : displayEmail,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Prompt'),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          gradient: LinearGradient(colors: [
                            Colors.pink,
                            Colors.pink,
                            Colors.purple
                          ]),
                        ),
                        child: Center(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            print('You Click');
                            editThread();
                          },
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.purple, spreadRadius: 3),
                    ],
                  ),
                  height: 400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<Null> editThread() async {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: ListTile(
                // leading: Image.asset('images/pencil.png'),
                title: Text(
                  'แก้ไขชื่อ',
                  style: TextStyle(
                      fontFamily: 'Prompt',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text('กรุณาใส่ชื่อที่ต้องการเปลี่ยน',
                    style: TextStyle(fontFamily: 'Prompt', fontSize: 14)),
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) =>
                                displayName = value.trim(), //ดึงค่า
                            initialValue: displayName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_box_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
// ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () async {
                        await Firebase.initializeApp().then((value) async {
                          await FirebaseAuth.instance
                              .authStateChanges()
                              .listen((event) async {
                            event
                                .updateProfile(displayName: displayName)
                                .then((value) {
                              fingDisplayName();
                              Navigator.pop(context);
                            });
                          });
                        });
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            ));
  }
}
