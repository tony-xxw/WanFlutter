import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/load_image.dart';

class Profile extends StatefulWidget {
  final double spreadHeight = 200.0;
  final List<String> mines = <String>["我收藏的", "我订阅的"];

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print("Size:  ${MediaQuery
        .of(context)
        .size
        .width} ");
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: widget.spreadHeight,
            floating: true,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                print("constraints ${constraints.toString()}");
                print("appBar Size:  ${constraints.biggest.height} ");
                print("statusBarHeight Size:  ${statusBarHeight} ");
                print("kToolbarHeight Size:  ${kToolbarHeight} ");
                double biggerHeight = constraints.biggest.height;
                double appBarHeight = biggerHeight - statusBarHeight;

                //t就是，变化的Scale
                final double t = (appBarHeight - kToolbarHeight) /
                    (widget.spreadHeight - kToolbarHeight);
                final Curve _textOpacity =
                const Interval(0.1, 1.0, curve: Curves.easeInOut);

                return Container(
                  child: Stack(
                    children: [
                      Container(
                        child: LoadAssetImage(
                          "main/ic_mine",
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: _textOpacity.transform(t),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage: AssetImage(
                                        'assets/images/common/ic_avatar.png'),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Wynne",
                                    style: TextStyle(
                                        color: Colours.bg_white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Opacity(
                                  opacity: _textOpacity.transform(t),
                                  child: Text(
                                    "10 关注 | 5关注",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                          ],
                        ),
                        bottom: 10,
                        left: 10,
                      ),
                      if (t == 0)
                        Container(
                          height: biggerHeight,
                          child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY: 2,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                          radius: 18,
                                          backgroundImage: AssetImage(
                                              'assets/images/common/ic_avatar.png'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Wynne",
                                          style: TextStyle(
                                              color: Colours.bg_white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,)
                                  ],
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              )),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Color.fromARGB(255, Random().nextInt(256) + 0,
                      Random().nextInt(256) + 0, Random().nextInt(256) + 0),
                  child: Text(widget.mines[index]),
                  height: 50,
                );
              }, childCount: widget.mines.length))
        ],
      ),
    );
  }
}
