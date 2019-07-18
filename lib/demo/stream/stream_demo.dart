import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;

  @override
  void dispose() { //移除小部件执行
    _streamDemo.close();  //不需要的stream关掉
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Cream a stream');
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData()); //一、fromFuture创建stream
    _streamDemo = StreamController<String>(); //二、StreamController创建

    print('Stat listening on a stream');
//    _streamDemoSubscription =
//        _streamDemo.listen(onData, onError: onError, onDone: onDone); //监听/订阅stream
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print('Initialize completed');
  }

  void onDone() {
    print('onDone');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    print('$data');
  }


  ////处理监听状态:暂停/恢复/取消监听
  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  void _resumeSteam() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  void _cancleSteam() {
    print('Cancle subscription');
    _streamDemoSubscription.cancel();
  }


  ////往stream添加数据data
  void _addDataToSteam() async {
    print('Add data to stream');

    String data = await fetchData();
    _streamDemo.add(data);
  }


  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'hello~';
//    throw 'Something happened';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Pause'),
              onPressed: _pauseStream,
            ),
            FlatButton(
              child: Text('Resume'),
              onPressed: _resumeSteam,
            ),
            FlatButton(
              child: Text('Cancle'),
              onPressed: _cancleSteam,
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: _addDataToSteam,
            ),
          ],
        ),
      ),
    );
  }
}
