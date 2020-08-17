import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanflutter/model/home_model.dart';
import 'package:wanflutter/pages/home/article.dart';
import 'package:wanflutter/pages/home/project.dart';
import 'package:wanflutter/provider/provider_widget.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/sticky_tab_bar.dart';

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
//              appBar: SearchBar(
//                rightImg: 'common/ic_menu',
//              ),
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
                      SliverAppBar(
                        expandedHeight: bannerHeight,
//                  floating: true,
                        //向下滚动时 即使列表项不在顶部,AppBar 也会向下滑动来展示
//                  snap: true,
                        // 只有floating 为true 才会生效 ,当向下滑动 快展示AppBar时,会有一个拉伸与吸附效果
                        pinned: true, //向上滑动时, 会收缩一部分AppBar作为展示
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text("WanAndroid-Flutter"),
                          background: fetchBannerView(context),
                        ),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: StickyTabBarDelegate(
                              child: TabBar(
                            isScrollable: true,
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.amberAccent,
                            labelColor: Colors.amberAccent,
                            unselectedLabelColor: Colours.dark_text,
                            dragStartBehavior: DragStartBehavior.start,
                            onTap: (index) {
                              onTabChangeClick(index);
                            },
                            tabs: List.generate(
                                _tabs.length,
                                (index) => Tab(
                                      text: _tabs[index],
                                    )),
                          ))),
                      SliverFillRemaining(
                        child: TabBarView(
                          children: _listTabView,
                          controller: _tabController,
                        ),
                      )
                    ],
                  )));
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

  Widget fetchBannerView(BuildContext context) {
    HomeModel homeModel = Provider.of(context);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: homeModel.banners
          .map((item) => Container(
                child: Center(
                    child: Image.network(item.imagePath,
                        fit: BoxFit.cover, width: 1000)),
              ))
          .toList(),
    );
  }
}
