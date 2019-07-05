import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return PageViewDemo();  //加3个视图
//    return PageViewBuiderDemo();  //视图加图片和文字
//    return GridViewCountDemo();
//    return GridViewExtentDemo();
     return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        post[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),  //网格视图四周内边距
      itemCount: post.length,
      itemBuilder: _gridItemBuilder, //构建视图项目的方法
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //控制视图项目的显示
//        crossAxisCount: 3, //交叉轴上项目的数量
//        crossAxisSpacing: 8.0, //水平间隔大小
//        mainAxisSpacing: 8.0, //垂直间隔大小
//      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( //控制视图项目的显示
        maxCrossAxisExtent: 150, 
        crossAxisSpacing: 8.0, //水平间隔大小
        mainAxisSpacing: 8.0, //垂直间隔大小
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) { //回调是index项目的索引号
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent( //网格视图,默认垂直滚动
      maxCrossAxisExtent: 150.0, //网格视图里的项目在交叉轴上的最大尺寸，水平滚动主轴是横轴，设置的是最大高度，垂直滚动是最大宽度
      crossAxisSpacing: 16.0, //上下左右间距
      mainAxisSpacing: 16.0,
//        scrollDirection: Axis.horizontal, //水平滚动,默认竖直滚动
      children: _buildTiles(100) //网络视图的项目,定义方法buildTiles,数量是100
    );
  }
}

//网格视图
class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) { //回调是index项目的索引号
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count( //网格视图,默认垂直滚动
        crossAxisCount: 3, //在交叉轴上显示的项目的数量
        crossAxisSpacing: 16.0, //上下左右间距
        mainAxisSpacing: 16.0,
//        scrollDirection: Axis.horizontal, //水平滚动,默认竖直滚动
        children: _buildTiles(100) //网络视图的项目,定义方法buildTiles,数量是100
    );
  }
}

class PageViewBuiderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack ( //添加叠加到一块显示的小部件
      children: <Widget>[
        SizedBox.expand(  //box尺寸占满所有可用空间
          child: Image.network(
            post[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(  //图片上添加文字内容
          bottom: 8.0,
          left: 8.0,
          child: Column( //子部件
            crossAxisAlignment: CrossAxisAlignment.start, //对齐
            children: <Widget>[
              Text(
                post[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 40),
              ),
              Text(
                post[index].author,
                style: TextStyle(color: Colors.blue, fontSize: 40),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder( //创建视图2
      itemCount: post.length,
      itemBuilder: _pageItemBuilder,  //值是一个方法,返回页面项目的小部件
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(   //创建视图1
//      pageSnapping: false, //不自动滚动到下一个
//      reverse: true, //倒置，最后一个变成第一个
//      scrollDirection: Axis.vertical, //默认水平滚动
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'), //切换时触发
      controller: PageController(
        initialPage: 0, //一开始显示的页面
        keepPage: false,  //不记录滚动到哪个页面
        viewportFraction: 0.85, //页面占用可视口比例，默认1.0
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}

