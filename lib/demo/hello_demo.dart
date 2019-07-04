import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   //build返回一个widge
    // TODO: implement build
    return Center(  //居中
      child: Text(
        'hello',
        textDirection: TextDirection.ltr, //文字从左向右阅读
        style: TextStyle(  //文字样式
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87
        ),
      ),
    );;
  }
}