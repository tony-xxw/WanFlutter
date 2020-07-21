import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[Text("我的")],
      ),
    );
  }
}
