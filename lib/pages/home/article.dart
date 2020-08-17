import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanflutter/common/icons_custom.dart';
import 'package:wanflutter/model/home_model.dart';
import 'package:wanflutter/res/colours.dart';

//文章列表
class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    HomeModel homeModel = Provider.of(context);

    if (homeModel.list.isEmpty) {
      return Center(
        child: Text("暂无数据"),
      );
    }

    return ListView.builder(
      itemBuilder: (
        _,
        index,
      ) {
        return buildBlogNetItem(homeModel.list[index]);
      },
      itemCount: homeModel.list.length,
    );
  }

  Widget buildBlogNetItem(item) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.3, color: Colours.text_gray_c))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconsCustom.icontouxiangnvhai_,
                        color: Colours.text_gray_c,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(item.shareUser.toString().isNotEmpty
                            ? item.shareUser
                            : "鸿洋"),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                item.title.toString().trim(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("收藏"),
                  Row(
                    children: [
                      Icon(
                        IconsCustom.icon_category,
                        color: Colours.bg_gray,
                      ),
                      Text("${item.superChapterName} / ${item.chapterName}")
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
