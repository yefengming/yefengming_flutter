import 'package:flutter/material.dart';
import '../model/post.dart';
import './post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _liatItemBuilder(BuildContext context, int index) {
    return Container(  //小部件
      color: Colors.white,  //背景颜色
      margin: EdgeInsets.all(8.0),  //Container外边距，四周8边距

      //一、竖排
//      child: Column(  //Container内容  竖排
//        children: <Widget>[   //一组widge
//          SizedBox(height: 16.0),
//          Image.network(post[index].imageUrl),  //图片来源网络
//          SizedBox(height: 16.0),  //下边距
//          Text(
//            post[index].title,
//            style: Theme.of(context).textTheme.title,
//          ),
//          Text(
//            post[index].author,
//            style: Theme.of(context).textTheme.subhead,
//          ),
//          SizedBox(height: 16.0),
//        ],
//      ),

      //二、Stack
      child: Stack(
        children: <Widget>[
          Column(  //Container内容  竖排
            children: <Widget>[   //一组widge
              AspectRatio(  //设置图片比例
                aspectRatio: 16/9,
                child: Image.network(post[index].imageUrl),  //图片来源网络,
              ),
              SizedBox(height: 16.0),
//              child: Image.network(post[index].imageUrl),  //图片来源网络,
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
          Positioned.fill( //fill上下左右位置不单独设置是0.0
            child: Material(
              color: Colors.transparent, //背景颜色透明
              child: InkWell( //渐墨效果区域
                splashColor: Colors.white.withOpacity(0.3), //渐墨颜色
                highlightColor: Colors.white.withOpacity(0.1), //高亮颜色
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostShow(post: post[index])),
                  );
                },
              ),
            ),
          ),
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