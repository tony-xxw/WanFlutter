import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/config/res/colours.dart';
import 'package:wanflutter/config/res/diment.dart';
import 'package:wanflutter/config/res/gaps.dart';
import 'package:wanflutter/config/res/strings.dart';
import 'package:wanflutter/config/widgets/load_image.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colours.bg_white,
          appBar: AppBar(
            brightness: Brightness.light,
            leading: Icon(
              Icons.arrow_back,
              color: Colours.bg_black,
            ),
            elevation: 0,
            backgroundColor: Colours.bg_white,
            title: Text("登录"),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap32,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "手机快捷登录",
                    style: TextStyle(
                        color: Colours.bg_black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Gaps.vGap50,
                TextField(
                  decoration: InputDecoration(
                      hintText: Strings.PHONE_HINT_LOGIN,
                      hintStyle: TextStyle(
                          color: Colours.bg_gray, fontSize: Dimens.font_sp14)),
                ),
                Gaps.vGap32,
                TextField(
                  decoration: InputDecoration(
                      hintText: Strings.VALIDATION_HINT_LOGIN,
                      hintStyle: TextStyle(
                          color: Colours.bg_gray, fontSize: Dimens.font_sp14)),
                ),
                Gaps.vGap50,
                Text(
                  Strings.REGISTER_HINT_LOGIN,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colours.dark_text_gray,
                      fontSize: Dimens.font_sp12),
                ),
                Gaps.vGap12,
                FlatButton(
                    height: Dimens.gap_dp40,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => {},
                    child: Text(
                      Strings.LOGIN_COMMON,
                      style: TextStyle(
                          color: Colours.bg_white,
                          fontWeight: FontWeight.w200,
                          fontSize: Dimens.font_sp16),
                    )),
                Gaps.vGap50,
                ThirdLogin()
              ],
            ),
          )),
    );
  }
}

class ThirdLogin extends StatefulWidget {
  @override
  _ThirdLoginState createState() => _ThirdLoginState();
}

class _ThirdLoginState extends State<ThirdLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colours.bg_gray,
                  height: 0.6,
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(Strings.THIRD_LOGIN_COMMON,
                      style: TextStyle(color: Colours.bg_gray)),
                ),
                Container(
                  color: Colours.bg_gray,
                  height: 0.6,
                  width: 60,
                ),
              ],
            ),
            Gaps.vGap32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoadAssetImage(
                  "common/ic_wechat",
                  width: 36,
                  height: 36,
                ),
                LoadAssetImage(
                  "common/ic_weibo",
                  width: 36,
                  height: 36,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
