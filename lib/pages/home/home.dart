import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/pages/home/blog_page.dart';
import 'package:wanflutter/pages/home/project_page.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Widget> _listTabView = [BlogPage(), ProjectPage()];

  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final List<String> imgList = [
    'https://pics3.baidu.com/feed/63d0f703918fa0ecbebca9de48f04ae93c6ddb5d.jpeg?token=5867474e1fcc999dedf1cccbbcf18df3',
    'https://pics4.baidu.com/feed/d50735fae6cd7b892552a4e1644351a0d9330e00.jpeg?token=1b581f4ede4eed576535e851223f31da',
    'https://i0.hdslb.com/bfs/archive/4a1de628f4182a6a12b8ca2135441209c71b9a8a.jpg@880w_388h_1c_95q',
    'https://i0.hdslb.com/bfs/archive/2166630deecf7b40d880de285d2ef0206747d15e.jpg@880w_388h_1c_95q',
  ];

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
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: itemBuilder(),
            ),
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

  List<Widget> itemBuilder() {
    return imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
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
