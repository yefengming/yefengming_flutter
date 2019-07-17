import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo2 extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo2> {
  int _count = 0;
  void _increaseCount () {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;  ////直接从CounterProvider获取
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return  ActionChip( //可以添加动作
      label: Text('$count'), //count是从父类StateManagementDemo中传过来的
      onPressed: increaseCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child); //执行superclass的构造函数

  //得到小部件的state：count、increaseCount
  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) { //是否通知继承了小部件的小部件，需要重建为true
    return true;
  }
}


