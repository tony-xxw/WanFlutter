import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wanflutter/entity/blogs.dart';
import 'package:wanflutter/net/dio_utils.dart';
import 'package:wanflutter/net/net_manager_service.dart';
import 'package:wanflutter/res/colours.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var mList = List<Datas>();

  @override
  void initState() {
    NetMangerService.fetchArticles(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return buildBlogNetItem(index);
      },
      itemExtent: 110.0,
      itemCount: 2,
    );
  }

  Widget buildBlogNetItem(index) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colours.bg_gray))),
      child: Text(mList.isEmpty ? "" : mList[index].chapterName),
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
