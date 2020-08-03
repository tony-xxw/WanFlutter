import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/net/dio_utils.dart';
import 'package:wanflutter/pages/home/blog_page.dart';
import 'package:wanflutter/pages/home/project_page.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Widget> _listTabView = [BlogPage(), ProjectPage()];

  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
//    DioUtils.instance.dio.get("article/list/1/json").then((response) => {
////          setState(() {
////            _list = response.data.datas;
////          })
//      print("111"+response.data.datas[0].title)
//        });
    _tabController = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(
          rightImg: 'common/ic_menu',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.amberAccent,
              labelColor: Colors.amberAccent,
              unselectedLabelColor: Colours.dark_text,
              dragStartBehavior: DragStartBehavior.start,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              tabs: <Widget>[
                Padding(
                  child: Text(
                    "热门博客",
                    style: TextStyle(fontSize: currentIndex == 0 ? 18.0 : 14.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                Padding(
                  child: Text(
                    "热门项目",
                    style: TextStyle(fontSize: currentIndex == 1 ? 18.0 : 14.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                  onPageChanged: _pageChange,
                  controller: _pageController,
                  itemBuilder: (_, index) => _listTabView[index]),
            )
          ],
        ));
  }

  void _pageChange(index) {
    _tabController.animateTo(index);
  }
}

class _TabItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}