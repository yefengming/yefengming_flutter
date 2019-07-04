import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  Widget _liatItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Image.network(post[index].imageUrl),
          SizedBox(height: 16.0),
          Text(
            post[index].title,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            post[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: post.length,
      itemBuilder: _liatItemBuilder,
    );
  }
}