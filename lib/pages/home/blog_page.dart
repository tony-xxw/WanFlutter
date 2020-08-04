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
      itemExtent: 48.0,
      itemCount: 4,
    );
  }

  Widget buildBlogItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Flex(
        children: <Widget>[],
      ),
    );
  }
}
