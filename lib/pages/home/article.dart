import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanflutter/model/home_model.dart';
import 'package:wanflutter/res/colours.dart';

//文章列表
class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeModel homeModel = Provider.of(context);
    debugPrint("homeModel," + homeModel.list[0].toString());
    return ListView.builder(
      itemBuilder: (
        _,
        index,
      ) {
        return buildBlogNetItem(homeModel.list[index]);
      },
      itemExtent: 110.0,
      itemCount: homeModel.list.length,
    );
  }

  Widget buildBlogNetItem(item) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colours.bg_gray))),
      child: Text(item.chapterName),
    );
  }

  Widget buildBlogItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: Image(
                  image: NetworkImage(
                      'https://upload.jianshu.io/users/upload_avatars/3018771/a6cf120c-5efc-4ecd-8257-1bfafe48b0ed.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text("李现"),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text("Android高级开发工程师"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
