import 'package:flutter/material.dart';
//import 'model/post.dart'; //数据
import './demo/listview_demo.dart'; //列表
import './demo/drawer_demo.dart'; //左滑右滑抽屉
import './demo/bottom_navigation_bar_demo.dart'; //导航栏和tabbar
import './demo/basic_demo.dart';  //基础部件，文字图像样式设置
import './demo/layout_demo.dart'; //布局
import './demo/view_demo.dart'; //view视图
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart'; //路由
import './demo/form_demo.dart';
import './demo/meterial_components.dart';
import './demo/state/state_management_demo.dart';
import './demo/state/state_management_demo2.dart';
import './demo/state/state_management_demo3.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/http/http_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //国际化
import 'package:yefengming_flutter/demo/i18n/map/yefengming_demo_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(  //小部件
      ////国际化
//      locale: Locale('en', 'US'), //当前使用的语言
//      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) { //当前使用的语言
//        return Locale('en', 'US');
//      },
      locale: Locale('zh', 'CN'),
      localizationsDelegates: [ //列表，生成本地化的值
        YefengmingDemoLocalizationsDelegate(), ////自己定义的本地化资源
        GlobalMaterialLocalizations.delegate, //提供应用里面Material提供的字符串
        GlobalWidgetsLocalizations.delegate, //定义小部件默认文字方向
      ],
      supportedLocales: [ //语言  //ios在info.plist里添加Localizations，添加语言
        Locale('en', 'US'), //表示语言的代码en，表示地区的代码US
        Locale('zh', 'CN'), //简体中文
      ],
      debugShowCheckedModeBanner: false, //隐藏右上角debug图标

      //首页
//      home: Home(), //一、默认的首页
//      home: NavigatorDemo(), //二、Navigator
//      initialRoute: '/',  //三。设置初始路由
//        initialRoute: '/form', //四、表单
//        initialRoute: '/mdc', //五、按钮/输入/对话框/列表
//        initialRoute: '/state_management', //六、state_management小部件
//        initialRoute: '/state_management2', //七、创建与使用InheritedWidget有效传递数据给子部件
//        initialRoute: '/state_management3', //八、使用ScopedModel传递数据
//        initialRoute: '/stream', // 九、stream
//        initialRoute: '/rxdart', //十、扩展的dart里的stream的功能
//        initialRoute: '/bloc', //十一、bloc
//        initialRoute: '/http', //十二、http
//        initialRoute: '/animation', //十二、animation
        initialRoute: '/i18n', //十三、i18n国际化

        //路由名字
      routes: {
//        '/': (context) => NavigatorDemo(),
        '/': (context) => Home(),
        '/about': (context) => Page(title: 'About'), // /和about表示路由的根，初始路由，默认要显示的，不初始默认为home，initialRoute初始路由
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MeterialComponents(),
        '/state_management': (context) => StateManagementDemo(),
        '/state_management2': (context) => StateManagementDemo2(),
        '/state_management3': (context) => StateManagementDemo3(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18nDemo(),
      },

      theme: ThemeData(
        primarySwatch: Colors.yellow, //导航栏颜色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //高亮颜色
        splashColor: Colors.white70, // 波纹颜色
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
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
