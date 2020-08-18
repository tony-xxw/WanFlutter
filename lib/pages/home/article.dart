import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanflutter/common/icons_custom.dart';
import 'package:wanflutter/model/home_model.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/load_image.dart';

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

    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (
            context,
            index,
          ) {
            return buildBlogNetItem(homeModel.list[index]);
          },
          itemCount: homeModel.list.length,
        ));
  }

  Widget buildBlogNetItem(item) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.3, color: Colours.bg_gray))),
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
                      LoadAssetImage(
                        "common/ic_head",
                        width: 24,
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(item.shareUser.toString().isNotEmpty
                            ? item.shareUser
                            : "鸿洋"),
                      )
                    ],
                  ),
                  Text(DateUtil.formatDateMs(item.shareDate,
                      format: DateFormats.h_m))
                ],
              ),
              SizedBox(height: 10),
              Text(
                item.title.toString().trim(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.0, color: Colours.bg_black),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    IconsCustom.icon_collection,
                    color: item.collect ? Colours.bg_blue : Colours.bg_gray,
                    size: 18.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        IconsCustom.icon_category,
                        color: Colours.bg_blue,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "${item.superChapterName} / ${item.chapterName}",
                        style:
                            TextStyle(fontSize: 12.0, color: Colours.bg_gray),
                      )
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
