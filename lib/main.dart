import 'package:flutter/material.dart';
//import 'model/post.dart'; //数据
import './demo/listview_demo.dart'; //列表
import './demo/drawer_demo.dart'; //左滑右滑抽屉
import './demo/bottom_navigation_bar_demo.dart'; //导航栏和tabbar
import './demo/basic_demo.dart';  //基础部件，文字图像样式设置
import './demo/layout_demo.dart'; //布局
import './demo/view_demo.dart'; //view视图
import './demo/sliver_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(  //小部件
      debugShowCheckedModeBanner: false, //隐藏右上角debug图标
      home: Home(), //一、默认的首页
//      home: SliverDemo(), //二、Sliver
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
      length: 5,
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
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.access_time)),
            ],
          ),
        ),
//      body: ListViewDemo(), //页面主体内容
        body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
//              Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
//              Icon(Icons.change_history, size: 128.0, color: Colors.black12),
              BasicDemo(),
//              Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
              LayoutDemo(),
              ViewDemo(),
              SliverDemo(),
            ],
        ),
        drawer: DrawerDemo(), //drawer:左边滑动显示,endDrawer:右边滑动显示
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

// Widget 小部件
//tabbar标签栏 tabview标签视图  tabviewcontroller标签控制器
