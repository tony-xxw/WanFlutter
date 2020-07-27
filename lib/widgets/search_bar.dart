import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/util/theme_utils.dart';
import 'package:wanflutter/widgets/load_image.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;
  final String backImg;
  final Function onPressed;

  SearchBar({Key key, this.hintText = '', this.backImg = "", this.onPressed})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = ThemeUtils.isDark((context));
    final Color iconColor =
        isDark ? Colours.dark_text_gray : Colours.text_gray_c;
    print("isDark " + isDark.toString());
    Widget back = Semantics(
      label: '返回',
      child: SizedBox(
        width: 48.0,
        height: 48.0,
        child: InkWell(
          onTap: () {
            _focus.unfocus();
            Navigator.maybePop(context);
          },
          borderRadius: BorderRadius.circular(24.0),
          child: Padding(
            key: const Key("search_back"),
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              widget.backImg,
              color: isDark ? Colours.dark_text : Colours.text,
            ),
          ),
        ),
      ),
    );

    Widget textField = Expanded(
      child: Container(
        height: 44.0,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        decoration: BoxDecoration(
            color: isDark ? Colours.dark_material_bg : Colours.search_bg,
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          key: const Key("search_text_field"),
          controller: _textEditingController,
          focusNode: _focus,
          maxLines: 1,
          textInputAction: TextInputAction.search,
          //软键盘回调
          onSubmitted: (val) {
            _focus.unfocus();
            widget.onPressed(val);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  top: 10.0, left: -8.0, right: -16.0, bottom: 14.0),
              border: InputBorder.none,
              icon: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                  child: LoadAssetImage(
                    "order/order_search",
                    width: 20,
                    height: 20,
                    color: iconColor,
                  )),
              hintText: widget.hintText,
              suffixIcon: GestureDetector(
                child: Semantics(
                  label: "清空",
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                    child: LoadAssetImage(
                      'order/order_delete',
                      width: 20,
                      height: 20,
                      color: iconColor,
                    ),
                  ),
                ),
                onTap: () {
                  SchedulerBinding.instance.addPersistentFrameCallback((_) {
                    _textEditingController.text = '';
                  });
                },
              )),
        ),
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Material(
        color: ThemeUtils.getBackgroundColors(context),
        child: SafeArea(
          child: Container(
            child: Row(
              children: <Widget>[textField],
            ),
          ),
        ),
      ),
    );
  }
}
