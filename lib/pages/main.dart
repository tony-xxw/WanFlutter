import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/net/dio_utils.dart';
import 'package:wanflutter/pages/home.dart';
import 'package:wanflutter/pages/profile.dart';
import 'package:wanflutter/pages/system.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/util/dimens.dart';
import 'package:wanflutter/util/theme_utils.dart';
import 'package:wanflutter/widgets/load_image.dart';
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
  final List<String> _appBarTitles = ['首页', '导航', '体系', '我'];
  final PageController _pageController = PageController();

  List<BottomNavigationBarItem> _list;
  List<BottomNavigationBarItem> _listDark;

  static const _imageSize = 25.0;

  @override
  void initState() {
    super.initState();
    DioUtils.instance.dio
        .get("article/list/1/json")
        .then((response) => {print("response" + response.toString())});
    testJson();
  }

  List<BottomNavigationBarItem> _buildDarkBottomNavigationBarItem() {
    if (_list == null) {
      var _tabImages = const [
        [
          LoadAssetImage('main/ic_home',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_home_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ],
        [
          LoadAssetImage('main/ic_home',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_home_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ],
        [
          LoadAssetImage('main/ic_home',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_home_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ],
        [
          LoadAssetImage('main/ic_home',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_home_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ]
      ];
      _list = List.generate(_tabImages.length, (index) {
        return BottomNavigationBarItem(
            icon: _tabImages[index][0],
            activeIcon: _tabImages[index][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _appBarTitles[index],
                key: Key(_appBarTitles[index]),
              ),
            ));
      });
    }
    return _list;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPageWidth(_indexNum),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ThemeUtils.getBackgroundColors(context),
        items: _buildDarkBottomNavigationBarItem(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _indexNum,
        elevation: 5,
        iconSize: 21,
        selectedFontSize: Dimens.font_sp10,
        unselectedFontSize: Dimens.font_sp10,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colours.nav_item_color,
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
}
