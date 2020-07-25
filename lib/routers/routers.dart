import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanflutter/pages/main.dart';
import 'package:wanflutter/pages/splash.dart';

class Routers {
  static String main = '/main';
  static String root = "/";

  static void configureRoute(Router router) {
    var splashHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Splash();
    });

    var homeHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Main();
    });

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("not find router");
    });

    router.define(root, handler: splashHandler);
    router.define(main, handler: homeHandler);
  }
}
