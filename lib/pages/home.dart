import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/net/dio_utils.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> _list = List();
  TabController _tabController;

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
              dragStartBehavior: DragStartBehavior.start,
              tabs: <Widget>[
                Text(
                  "热门",
                  style: TextStyle(color: Colours.nav_item_color),
                ),
                Text(
                  "热门项目",
                  style: TextStyle(color: Colours.dark_text),
                )
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Center(
                    child: Text("1111"),
                  );
                },
                itemExtent: 48.0,
                itemCount: 4,
              ),
            )
          ],
        ));
  }
}

class _TabItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
