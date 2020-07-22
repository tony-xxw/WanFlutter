import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanflutter/net/dio_utils.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    DioUtils.instance.dio
        .get("article/list/1/json")
        .then((response) => {print("response" + response.toString())});
    testJson();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[Text("首页")],
      ),
    );
  }

  void testJson() {
    //内联JSON
    String json = '{"name":"xxw","age":"18"}';
    Map<String, dynamic> map = jsonDecode(json);
    print("name: " + map['name']);
    print("age: " + map['age']);
  }
}
