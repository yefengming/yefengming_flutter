import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return TextDemo();
//  return RichTextDemo();
  return Container(
//    color: Colors.grey[100], //color和背景image不能同时设置

    decoration: BoxDecoration(
      image: DecorationImage(  //背景图像
        image: NetworkImage('http://pic39.nipic.com/20140320/12795880_110914420143_2.jpg'),
//        image: AssetImage(assetName) //项目里的图像
        alignment: Alignment.topCenter, //图像位置
//        repeat: ImageRepeat.repeatY, //设置重复
        fit: BoxFit.cover, //填充模式(保持比例充满)
        colorFilter: ColorFilter.mode(  //设置颜色滤镜
          Colors.indigoAccent[400].withOpacity(0.5),  //滤镜颜色
          BlendMode.hardLight, //滤镜的混合模式
        ),
      ),
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, //居中
      children: <Widget>[
        Container(
          child: Icon(Icons.pool, size: 32.0, color: Colors.white),
//          color: Color.fromRGBO(3, 54, 255, 1.0),  //这个color和decoration里的color不能同时用
//          padding: EdgeInsets.only(left: 24.0, right: 8.0), //分别设置左右边距
          padding: EdgeInsets.all(16.0), //四周边距
          margin: EdgeInsets.all(8.0), //左边边距
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(3, 54, 255, 1.0), //颜色
            border: Border.all( //四周添加边框
              color: Colors.indigoAccent[100],
              width: 3.0,
              style: BorderStyle.solid,
            ), //添加四周边框
//            borderRadius: BorderRadius.circular(16.0), //圆形盒子不能使用圆角效果 //设置四周圆角效果
            boxShadow: [   //添加一组阴影效果
              BoxShadow(
                offset: Offset(0.0, 0.0), //偏移量x和y
                color: Color.fromRGBO(16, 20, 188, 1.0),
                blurRadius: 25.0, //阴影模糊程度，越大模糊越明显
                spreadRadius: -9.0, //阴影扩散程度,正数扩大阴影面积，负数缩小阴影面积
              ),
            ],
            shape: BoxShape.circle, //改变盒子形状（圆形）
            gradient: LinearGradient(  //线性渐变
              colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 28, 128, 1.0),
              ],
              begin: Alignment.topCenter,  //渐变开始和结束的位置
              end: Alignment.bottomCenter,
            ),

//            gradient: RadialGradient( //镜像渐变
//              colors: [
//                Color.fromRGBO(7, 102, 255, 1.0),
//                Color.fromRGBO(3, 28, 128, 1.0),
//              ],
//            ),

//            borderRadius: BorderRadius.only(  //分别设置四周圆角效果
//              topLeft: Radius.circular(64.0),
//              bottomLeft: Radius.circular(64.0),
//            ),

//            border: Border( //分别添加上下边框
//              top: BorderSide(
//               color: Colors.indigoAccent[100],
//                width: 3.0,
//                style: BorderStyle.solid,
//              ),
//              bottom: BorderSide(
//                color: Colors.indigoAccent[100],
//                width: 3.0,
//                style: BorderStyle.solid,
//              ),
//            ),
          ),
        ),
      ],
    ),
  );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(  //一行文字多种样式
      text: TextSpan(
        text: 'yy',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100, //粗细
        ),
        children: [ //一行里显示的其他样式
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '李白';
  final String _title = '将进酒';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '《$_title》-- $_author.  大开发经济发卡机按时付款方开饭啦副卡阿发开发咖啡机啊发卡量；放阿肯定交罚款咖啡机啊开房卡劳动纠纷卡丽风景艾克；发链接奥卡福咖啡机卡乐芙卡发链接安抚巾',
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis, //省略号
    );
  }
}