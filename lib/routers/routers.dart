import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanflutter/pages/login/login.dart';
import 'package:wanflutter/pages/main.dart';
import 'package:wanflutter/pages/splash.dart';

class Routers {
  static String root = "/";
  static String main = '/main';
  static String login = "/login";

  static void configureRoute(Router router) {
    var splashHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Splash();
    });

    var homeHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Main();
    });


    var loginHandler = Handler(
      handlerFunc: (BuildContext cotext,Map<String,List<String>> params){
      return LoginPage();
      }
    );

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("not find router");
    });

    router.define(root, handler: splashHandler);
    router.define(main, handler: homeHandler);
    router.define(login, handler: loginHandler);
  }
}
