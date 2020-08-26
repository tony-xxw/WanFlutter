import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/config/res/colours.dart';
import 'package:wanflutter/pages/shunt/navigation.dart';
import 'package:wanflutter/pages/system/system.dart';

class ShuntPage extends StatefulWidget {
  @override
  _ShuntPageState createState() => _ShuntPageState();
}

class _ShuntPageState extends State<ShuntPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = <String>["体系", "导航"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colours.bg_blue,
          title: TabBar(
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colours.bg_white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colours.bg_white,
            tabs: List.generate(
                _tabs.length,
                (index) => Tab(
                      text: _tabs[index],
                    )),
          ),
        ),
        body: TabBarView(
          children: [Navigation(), System()],
        ),
      ),
    );
  }
}
