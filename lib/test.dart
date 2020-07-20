import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/net/DioUtils.dart';
import 'package:wanflutter/sample/tab.dart';

Future<void> main() async {
  await SpUtil.getInstance();

  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(TestHome());
  DioUtils();
}

class TestHome extends StatelessWidget {
  final Widget home;
  final ThemeData theme;

  TestHome({this.home, this.theme}) {
    initDio();
  }

  void initDio() {
    final List<Interceptor> interceptor = [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"tab": (context) => TabHome()},
      home: TestBody(),
    );
  }
}

class TestBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("底部Tab页"),
              onPressed: () => {Navigator.pushNamed(context, "tab")},
            )
          ],
        ),
      ),
    );
  }
}
