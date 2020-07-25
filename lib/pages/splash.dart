import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanflutter/routers/application.dart';
import 'package:wanflutter/routers/routers.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 1),(){
      print("111");
      Application.router.navigateTo(context, Routers.main,replace: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.purple),
      child: Center(
        child: Text("欢迎页"),
      ),
    );
  }
}
