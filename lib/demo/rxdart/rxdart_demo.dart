import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  
  @override
  void initState() {
    super.initState();

    //五、准备一个文本框往Observable上添加数据
    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
//        .map((item) => 'item: $item') //RxDart数据转换方法
//        .where((item) => item.length > 9) //测试条件，长度大于9
        .debounce(Duration(milliseconds: 500)) //debounce停止输入500毫秒之后打印
        .listen((data) => print(data));
    

    ////一
//    Observable<String> _observable =
////        Observable(Stream.fromIterable(['hello', '您好']));
////         Observable.fromFuture(Future.value('hello~'));
////          Observable.fromIterable(['hello', '您好']);
////        Observable.just('hello');
//       Observable.periodic(Duration(seconds: 3), (x) => x.toString()); //每隔3秒重复输出次数
//
//    _observable.listen(print); //打印Observable上的数据

//     ////二
//    PublishSubject<String> _subject = PublishSubject<String>();
//    _subject.listen((data) => print('listen 1: $data')); //添加订阅
//    _subject.add('hello'); //往Observable添加数据
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}')); //转为大写
////    _subject.add('hola');
//

    ////三 1.
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
//    _subject.listen((data) => print('listen 1: $data')); //添加订阅
//    _subject.add('hello'); //往Observable添加数据
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}')); //转为大写
//    _subject.add('hola');  /* 打印：flutter: listen 1: hello
//                              flutter: listen 2: HELLO
//                              flutter: listen 2: HOLA
//                              flutter: listen 1: hola*/

    ////三 2.
//    BehaviorSubject<String> _subject = BehaviorSubject<String>(); //收到最后一次添加的数据
//    _subject.add('hello');
//    _subject.add('hola');
//    _subject.listen((data) => print('listen 1: $data'));
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}')); //打印：flutter: listen 1: hola;flutter: listen 2: HOLA

    ////四 1.
//    ReplaySubject<String> _subject = ReplaySubject<String>(); //1和2收到所有数据
//    _subject.add('hello');
//    _subject.add('hola');
//    _subject.listen((data) => print('listen 1: $data'));
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
//    /*flutter: listen 1: hello
//      flutter: listen 2: HELLO
//      flutter: listen 1: hola
//      flutter: listen 2: HOLA
//     */

    ////四 2.
//    ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2); //1和2收到所有数据,设置收到的最大个数
//    _subject.add('hello');
//    _subject.add('hola');
//    _subject.add('hi');
//    _subject.listen((data) => print('listen 1: $data'));
//    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
//
//    _subject.close();

  }


  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) { //值有变化
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) { //回车提交
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}

