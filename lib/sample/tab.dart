import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TabHome());


class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: TabBody(),
    );
  }
}

class TabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab页"),
      ),
      body: Center(

      ),
    );
  }
}