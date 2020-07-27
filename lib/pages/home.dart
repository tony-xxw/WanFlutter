import 'package:flutter/material.dart';
import 'package:wanflutter/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: "搜索关键词以空格形式隔开",
      ),
    );
  }
}
