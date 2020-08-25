import 'package:flutter/cupertino.dart';
import 'package:wanflutter/config/res/colours.dart';
import 'package:wanflutter/config/widgets/load_image.dart';

class System extends StatefulWidget {
  @override
  _System createState() => _System();
}

class _System extends State<System> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LoadAssetImage(
            "main/ic_mine",
            width: 100,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          Container(
            color: Colours.bg_blue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("1111"),
                SizedBox(
                  height: 10,
                ),
                Text("222"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
