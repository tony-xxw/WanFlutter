import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanflutter/model/home_model.dart';
import 'package:wanflutter/pages/home/article.dart';
import 'package:wanflutter/pages/home/project.dart';
import 'package:wanflutter/provider/provider_widget.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Widget> _listTabView = [Article(), Project()];
  final List<String> _tabs = ['热门博客', '热门项目'];

  TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final List<String> _imgList = [
    'https://pics3.baidu.com/feed/63d0f703918fa0ecbebca9de48f04ae93c6ddb5d.jpeg?token=5867474e1fcc999dedf1cccbbcf18df3',
    'https://pics4.baidu.com/feed/d50735fae6cd7b892552a4e1644351a0d9330e00.jpeg?token=1b581f4ede4eed576535e851223f31da',
    'https://i0.hdslb.com/bfs/archive/4a1de628f4182a6a12b8ca2135441209c71b9a8a.jpg@880w_388h_1c_95q',
    'https://i0.hdslb.com/bfs/archive/2166630deecf7b40d880de285d2ef0206747d15e.jpg@880w_388h_1c_95q',
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  void _pageChange(index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;
    return ProviderWidget<HomeModel>(
        model: HomeModel(),
        onModelReady: (homeModel) {
          homeModel.initData();
        },
        builder: (context, homeModal, child) {
          return Scaffold(
              appBar: SearchBar(
                rightImg: 'common/ic_menu',
              ),
              body: SmartRefresher(
                controller: homeModal.refreshController,
                enablePullUp: homeModal.list.isNotEmpty,
                enablePullDown: homeModal.list.isNotEmpty,
                onLoading: homeModal.loadMore,
                onRefresh: () async {
                  await homeModal.refresh();
                  homeModal.showErrorMessage(context);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (homeModal.list.isEmpty) {
                          return Text("暂无数据");
                        }

                        return Text(homeModal.list[index].chapterName);
                      }),
                    )
                  ],
                ),
//                  children: <Widget>[
//                    CustomScrollView(
//                      slivers: [
//                        PageView.builder(
//                            onPageChanged: _pageChange,
//                            controller: _pageController,
//                            itemBuilder: (_, index) => _listTabView[index]),
//                        CarouselSlider(
//                          options: CarouselOptions(
//                            autoPlay: true,
//                            aspectRatio: 2.0,
//                            enlargeCenterPage: true,
//                          ),
//                          items: fetchBannerItem(bannerHeight),
//                        ),
//                        SliverList(delegate: SliverChildBuilderDelegate((
//                            BuildContext context, int index) {
//
//                          return TabBar(
//                            isScrollable: true,
//                            controller: _tabController,
//                            indicatorSize: TabBarIndicatorSize.label,
//                            indicatorColor: Colors.amberAccent,
//                            labelColor: Colors.amberAccent,
//                            unselectedLabelColor: Colours.dark_text,
//                            dragStartBehavior: DragStartBehavior.start,
//                            onTap: (index) {
//                              onTabChangeClick(index);
//                            },
//                            tabs: List.generate(
//                                _tabs.length,
//                                    (index) =>
//                                    Tab(
//                                      text: _tabs[index],
//                                    )),
//                          );
//                        }))
//                      ],
//                    )

//                  ],
              ));
        });
  }

  void onTabChangeClick(index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  List<Widget> fetchTabItem(tabs) {
    return tabs.map((item) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(item.chapterName,
            style: TextStyle(fontSize: currentIndex == 1 ? 18.0 : 14.0))));
  }

  Padding fetchTabTest(item) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(item.chapterName,
            style: TextStyle(fontSize: currentIndex == 1 ? 18.0 : 14.0)));
  }

  List<Widget> fetchBannerItem(defaultHeight) {
    return _imgList
        .map((item) => Container(
              child: Container(
                height: defaultHeight,
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
                              'No. ${_imgList.indexOf(item)} image',
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
}
