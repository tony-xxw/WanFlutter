import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/res/colours.dart';

import 'package:wanflutter/routers/application.dart';
import 'package:wanflutter/routers/routers.dart';
import 'package:wanflutter/util/device_utils.dart';

import 'common/common.dart';
import 'net/dio_utils.dart';
import 'net/interceptor.dart';

void main() {
  runApp(App());

  if (Device.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

const defaultTitle = "WanAndroid";

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  _App() {
//    initDio();
    initRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Georgia',
          primaryColor: Colours.nav_item_color,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'))),
      title: defaultTitle,
    );
  }

  void initDio() {
    final List<Interceptor> interceptors = [];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    setInitDio(
      interceptors: interceptors,
    );
  }

  void initRouter() {
    Router router = Router();
    Routers.configureRoute(router);
    Application.router = router;
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
