import 'package:flutter/material.dart';
//import 'model/post.dart';
import './demo/listview_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(  //小部件
      debugShowCheckedModeBanner: false, //隐藏右上角debug图标
      home: Home(), //默认的首页
      theme: ThemeData(
          primarySwatch: Colors.yellow //导航栏颜色
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100], //页面颜色
      appBar: AppBar(  //顶部工具栏
        title: Text('yy'),
        elevation: 40.0, //导航栏底部阴影
      ),
//      body: ListViewDemo(), //页面主体内容
    body: null,
    );
  }
}

// Widget 小部件

