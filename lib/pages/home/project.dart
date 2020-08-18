import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanflutter/entity/articles.dart';
import 'package:wanflutter/model/project_model.dart';
import 'package:wanflutter/res/colours.dart';
import 'package:wanflutter/widgets/load_image.dart';

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    ProjectModal projectModal = Provider.of(context);

    if (projectModal.list.isEmpty) {
      return Center(
        child: Text("暂无数据"),
      );
    }
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (context, index) {
            Article article = projectModal.list[index];
            return fetchProjectItem(context, article);
          },
          itemCount: projectModal.list.length,
        ));
  }

  Widget fetchProjectItem<Article>(context, item) {
    return Container(
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 0.3, color: Colours.bg_gray))),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
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
                      Text(
                        item.desc.toString().trim(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 14.0, color: Colours.bg_black),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  flex: 1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    item.envelopePic,
                    fit: BoxFit.cover,
                    width: 84,
                    height: 64,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
