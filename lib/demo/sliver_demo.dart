import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('yyyyy'),
//            pinned: true, //SliverAppBar固定在顶部
            floating: true, //向下滚动SliverAppBar会接着显示出来
            expandedHeight: 178.0, //SliverAppBar伸展高度
            flexibleSpace: FlexibleSpaceBar(  //弹性空间
              title: Text(
                'yyyy Flutter'.toUpperCase(),//设置大写
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea( //在安全区域显示
            sliver: SliverPadding(  //SliverGrid中没有padding，设置内边距用SliverPadding
              padding: EdgeInsets.all(8.0),
//              sliver: SliverGridDemo(),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 14.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.network(
                        post[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        children: <Widget>[
                          Text(
                            post[index].title,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            post[index].author,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: post.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, //控制网格视图项目显示比例
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            child: Image.network(
              post[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: post.length,
      ),
    );
  }
}