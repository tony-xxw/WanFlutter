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
//    DioUtils.instance.dio
//        .get("article/list/1/json")
//        .then((response) => {print("response" + response.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[Text("首页")],
      ),
    );
  }
}
