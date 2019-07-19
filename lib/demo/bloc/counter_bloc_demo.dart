import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _countBloc = CounterProvider.of(context).bloc;

//    return Center(
//      child: ActionChip(
//        label: Text('0'),
//        onPressed: () {
////          _countBloc.log(); //打印
//          _countBloc.counter.add(1); //添加值
//        },
//      ),
//    );

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _countBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'), //snapshot.data:_countBloc.count的数据
            onPressed: () {
//          _countBloc.log(); //打印
              _countBloc.counter.add(1); //添加值
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _countBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
//        _countBloc.log();
        _countBloc.counter.add(1);
      },
    );
  }
}

////使用InheritedWidget传递bloc
class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  final _counterActionController = StreamController<int>();  //使用Sink输入数据
  StreamSink<int> get counter => _counterActionController.sink;


  int _count = 0;
  final _countController = StreamController<int>(); //用Stream输出数据
  Stream<int> get count => _countController.stream;


  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');

    _count = data + _count;
    _countController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _countController.close();
  }

  void log() {
    print('Bloc');
  }
}

