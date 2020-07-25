import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;

  final Function onPressed;

  SearchBar({Key key, this.hintText = '', this.onPressed}) : super(key: key);

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
    return Container(
      color: Colors.lightBlueAccent,
    );
  }
}
