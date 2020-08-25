import 'package:flutter/material.dart';
import 'package:wanflutter/config/res/colours.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: Colours.bg_black,),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("登录"),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
            ),
          ),
        ),
      ),
    );
  }
}
