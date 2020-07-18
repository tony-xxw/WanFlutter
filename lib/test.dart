import 'package:flutter/material.dart';
import 'package:wanflutter/sample/tab.dart';

void main() => runApp(TestHome());

class TestHome extends StatelessWidget {
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
