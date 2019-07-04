import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  Widget _liatItemBuilder(BuildContext context, int index) {
    return Container(  //小部件
      color: Colors.white,  //背景颜色
      margin: EdgeInsets.all(8.0),  //Container外边距，四周8边距
      child: Column(  //Container内容  竖排
        children: <Widget>[   //一组widge
          SizedBox(height: 16.0),
          Image.network(post[index].imageUrl),  //图片来源网络
          SizedBox(height: 16.0),  //下边距
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
    return ListView.builder(  //列表视图
      itemCount: post.length,  //数量
      itemBuilder: _liatItemBuilder,  //列表视图的项目
    );
  }
}