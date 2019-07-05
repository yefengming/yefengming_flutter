import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//    return IconBadge(Icons.pool);

//     return Column( //竖排
//       children: <Widget>[
//         IconBadge(Icons.pool, size: 64.0,), //不设置尺寸使用默认的32.0
//       ],
//     );

     return Container(
       child: Column(  //Column竖排（主轴从上往下,交叉轴是横的）,Row横排（主轴从左往右，交叉轴是竖的）
         mainAxisAlignment: MainAxisAlignment.center,  //spaceAround剩下的空间分配到小部件周围,spaceEvenly剩下的平均分配
//         crossAxisAlignment: CrossAxisAlignment.end, //交叉轴的对齐
         children: <Widget>[
//           IconBadge(Icons.pool),
//           IconBadge(Icons.beach_access, size: 64.0,),
//           IconBadge(Icons.airplanemode_active),

//           StackDemo(),  //Stack小部件

//             AspectRatioDemo(), //设置宽高比的容器

            ConstrainedBox(  //给子部件添加限制，比如最大最小宽度
              constraints: BoxConstraints(  //设置最小最大的宽度
                minHeight: 200.0,
                maxWidth: 200.0,
              ),
              child: Container(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
            ),

         ],
       ),
     );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 3.0/2.0, //宽高比3：2
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft, //顶部靠左对齐
      children: <Widget>[
        SizedBox(   //SizedBox可以放到Stack外面,不会叠加到一块
          width: 200.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(0.0, -1.0),
//                alignment: Alignment(1.0, 1.0), //小部件距Container位置
//                alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
//                    child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0,), //小图标
          ),
        ),
        SizedBox(
          height: 32.0,  //留出间隔
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
//                      borderRadius: BorderRadius.circular(8.0),  //圆角效果
              shape: BoxShape.circle, //形状为圆形
              gradient: RadialGradient(  //镜像渐变
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0),
                ],
              ),
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0,), //小图标
          ),
        ),
        Positioned(  //Stack里加Positioned小部件，分别设置位置，相对于Stack里最大的部件
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0,),
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  
  IconBadge(this.icon, {
    this.size = 32.0,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white,), //图标
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}