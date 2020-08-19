import 'package:flutter/material.dart';
import 'package:wanflutter/pages/navigation.dart';
import 'package:wanflutter/pages/system.dart';
import 'package:wanflutter/res/colours.dart';

class ShuntPage extends StatefulWidget {
  @override
  _ShuntPageState createState() => _ShuntPageState();
}

class _ShuntPageState extends State<ShuntPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = <String>["体系", "导航"];
  final List<Widget> _page = <Widget>[Navigation(), System()];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Colours.bg_blue,
        controller: _tabController,
        tabs: List.generate(
            _tabs.length,
            (index) => Tab(
                  text: _tabs[index],
                )),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _page,
      ),
    );
  }
}
