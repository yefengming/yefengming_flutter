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
        primarySwatch: Colors.yellow, //导航栏颜色
        highlightColor: Colors.red, //高亮颜色
        splashColor: Colors.blue // 波纹颜色
      )
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100], //页面颜色
        appBar: AppBar(  //顶部工具栏
//          leading: IconButton( //使用Drawer后可以自动添加button
//            icon: Icon(Icons.menu), //菜单
//            tooltip: 'Navigration', //说明
//            onPressed: () => debugPrint('Navigation button'),  //导航栏左上角点击
//          ),
          title: Text('yy'),
          actions: <Widget>[  //导航栏右上角
            IconButton(
              icon: Icon(Icons.search), //搜索
              tooltip: 'Search', //说明
              onPressed: () => debugPrint('Search button'),  //导航栏左上角点击
            ),
//          IconButton(
//            icon: Icon(Icons.more_horiz),
//            tooltip: 'Search', //说明
//            onPressed: () => debugPrint('Search button'),  //导航栏左上角点击
//          ),
          ],
          elevation: 40.0, //导航栏底部阴影
          bottom: TabBar(
            //自定义标签样式
            unselectedLabelColor: Colors.black38, //未被选中标签颜色
            indicatorColor: Colors.red, //选中标签颜色
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
//      body: ListViewDemo(), //页面主体内容
        body: TabBarView(
            children: <Widget>[
              Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
              Icon(Icons.change_history, size: 128.0, color: Colors.black12),
              Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
            ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('header'.toUpperCase()), //大写
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Messages', textAlign: TextAlign.right,),
                trailing: Icon(Icons.message, color: Colors.black12, size: 22,),
                onTap: () => Navigator.pop(context),
              ),
               ListTile(
                title: Text('Favorite', textAlign: TextAlign.right,),
                trailing: Icon(Icons.favorite, color: Colors.black12, size: 22,),
                 onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Settings', textAlign: TextAlign.right,),
                trailing: Icon(Icons.settings, color: Colors.black12, size: 22,),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ), //左边滑动显示
//        endDrawer: Container(  //右边滑动显示
//          color: Colors.white,
//          padding: EdgeInsets.all(28.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text('This is deawer')
//            ],
//          ),
//        ),
      ),
    );
  }
}

// Widget 小部件
//tabbar标签栏 tabview标签视图  tabviewcontroller标签控制器
