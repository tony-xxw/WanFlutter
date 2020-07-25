import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/net/dio_utils.dart';
import 'package:wanflutter/pages/home.dart';
import 'package:wanflutter/pages/profile.dart';
import 'package:wanflutter/pages/system.dart';
import 'package:wanflutter/widgets/search_bar.dart';

import '../app.dart';
import 'navigation.dart';

class Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  int _indexNum = 0;
  List<Widget> widgetList = [Home(), Navigation(), System(), Profile()];

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
    return Scaffold(
      drawer: MenuDraw(),
      appBar: SearchBar(
        hintText: "请搜索",
      ),
      body: _getPageWidth(_indexNum),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            title: Text("导航"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.system_update),
            title: Text("体系"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我"),
          )
        ],
        iconSize: 24,
        currentIndex: _indexNum,
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (_indexNum != index) {
            setState(() {
              _indexNum = index;
            });
          }
        },
      ),
    );
  }

  Widget _getPageWidth(index) {
    return widgetList[index];
  }

  void testJson() {
    //内联JSON
    String json = '{"name":"xxw","age":"18"}';
    Map<String, dynamic> map = jsonDecode(json);
    print("name: " + map['name']);
    print("age: " + map['age']);
  }
}
