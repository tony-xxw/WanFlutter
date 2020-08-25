import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanflutter/common/icons_custom.dart';
import 'package:wanflutter/config/res/colours.dart';
import 'package:wanflutter/config/widgets/load_image.dart';
import 'package:wanflutter/entity/articles.dart';
import 'package:wanflutter/model/home_model.dart';

class OverHead extends StatefulWidget {
  @override
  _OverHeadState createState() => _OverHeadState();
}

class _OverHeadState extends State<OverHead> {
  @override
  Widget build(BuildContext context) {
    HomeModel model = Provider.of(context);
    return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      Article article = model.articles[index];
      return buildBlogNetItem(article);
    },childCount: model.articles.length));
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
                style: TextStyle(fontSize: 14.0, color: Colours.bg_black,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colours.bg_white,
                              border: Border(
                                top: BorderSide(
                                    width: 1.0, color: Colours.bg_blue),
                                bottom: BorderSide(
                                    width: 1.0, color: Colours.bg_blue),
                                left: BorderSide(
                                    width: 1.0, color: Colours.bg_blue),
                                right: BorderSide(
                                    width: 1.0, color: Colours.bg_blue),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            '顶置',
                            style: TextStyle(
                                fontSize: 12.0, color: Colours.dark_text_gray),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      if (item.fresh)
                        Container(
                            alignment: Alignment.center,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colours.bg_white,
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: Colours.bg_blue),
                                  bottom: BorderSide(
                                      width: 1.0, color: Colours.bg_blue),
                                  left: BorderSide(
                                      width: 1.0, color: Colours.bg_blue),
                                  right: BorderSide(
                                      width: 1.0, color: Colours.bg_blue),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              '新',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colours.dark_text_gray),
                            )),
                      SizedBox(width: 10,),
                      Icon(
                        IconsCustom.icon_collection,
                        color: item.collect ? Colours.bg_blue : Colours.bg_gray,
                        size: 18.0,
                      )
                    ],
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
