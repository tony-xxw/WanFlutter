import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/config/res/colours.dart';
import 'package:wanflutter/config/widgets/load_image.dart';
import 'package:wanflutter/pages/shunt/shunt.dart';
import 'package:wanflutter/pages/system/system.dart';
import 'package:wanflutter/util/dimens.dart';
import 'package:wanflutter/util/theme_utils.dart';

import 'home/home.dart';
import 'mine/profile.dart';

/// 首页
class Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  int _indexNum = 0;
  List<Widget> widgetList = [Home(), ShuntPage(), System(), Profile()];
  final List<String> _appBarTitles = ['首页', '导航', '体系', '我'];
  final PageController _pageController = PageController();

  List<BottomNavigationBarItem> _list;
  List<BottomNavigationBarItem> _listDark;

  static const _imageSize = 25.0;

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
          LoadAssetImage('main/ic_nav',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_nav_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ],
        [
          LoadAssetImage('main/ic_map',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_map_selected',
              width: _imageSize, color: Colours.selected_nav_item_color)
        ],
        [
          LoadAssetImage('main/ic_profile',
              width: _imageSize, color: Colours.nav_item_color),
          LoadAssetImage('main/ic_profile_selected',
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
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        unselectedItemColor: Colours.dark_text,
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
