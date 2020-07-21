import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/pages/home.dart';
import 'package:wanflutter/pages/navigation.dart';
import 'package:wanflutter/pages/profile.dart';
import 'package:wanflutter/pages/system.dart';

void main() {
  runApp(Main());
}

const defaultTitle = "WanAndroid";

class Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  int _indexNum = 0;
  List<Widget> widgetList = [Home(), Navigation(), System(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: defaultTitle,
      home: Scaffold(
        drawer: MenuDraw(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchPageCustomDelegate());
              },
            )
          ],

          title: Text(defaultTitle),
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
      ),
    );
  }

  Widget _getPageWidth(index) {
    return widgetList[index];
  }
}

class MenuDraw extends StatelessWidget {
  const MenuDraw();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.subscriptions),
                title: Text("公众号"),
                onTap: () {
                  print("公众号");
                },
              ),
              ListTile(
                leading: Icon(Icons.subscriptions),
                title: Text("公众号"),
                onTap: () {
                  print("公众号");
                },
              ),
              ListTile(
                leading: Icon(Icons.subscriptions),
                title: Text("公众号"),
                onTap: () {
                  print("公众号");
                },
              )
            ],
          )),
    );
  }
}

class SearchPageCustomDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: "Clear",
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
