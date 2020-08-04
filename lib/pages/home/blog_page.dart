import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return buildBlogItem();
      },
      itemExtent: 110.0,
      itemCount: 2,
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
