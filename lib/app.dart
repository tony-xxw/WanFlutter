import 'package:common_utils/common_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/routers/application.dart';
import 'package:wanflutter/routers/routers.dart';
import 'package:wanflutter/util/device_utils.dart';
import 'package:wanflutter/util/platform_utils.dart';

void main() {
  runApp(App());
}

const defaultTitle = "WanAndroid";

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  _App() {
    LogUtil.init(tag: "XXW", isDebug: !inProduction);
    initRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Georgia',
          primaryColor: Colours.bg_primary,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'))),
      title: defaultTitle,
    );
  }

  void initRouter() {
    Router router = Router();
    Routers.configureRoute(router);
    Application.router = router;
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
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    throw UnimplementedError();
  }
}
