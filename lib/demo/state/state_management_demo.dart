import 'package:flutter/material.dart';

//一、无变化状态的小部件 StatelessWidget
//class StateManagementDemo extends StatelessWidget { //StatelessWidget不包含可以变化的状态，这个小部件创建了之后，里面状态就不会有变化
//  int count = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('StateManagementDemo'),
//        elevation: 0.0,
//      ),
//      body: Center(
//        child: Chip(
//          label: Text('$count'),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          count += 1;
//          print(count);
//        },
//      ),
//    );
//  }
//}


//二、带变化状态的小部件 StatelessWidget
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount () {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
//      body: Center(
//        child: Chip(
//          label: Text('$_count'),
//        ),
//      ),
//      body: Counter(_count, _increaseCount), //一、数据传到Counter
      body: CounterWrapper(_count, _increaseCount), //二、数据传到CounterWrapper
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Counter(count, increaseCount),
    );
  }
}

//一、数据从父类StateManagementDemo传过来
//class Counter extends StatelessWidget {
//  final int count;
//  final VoidCallback increaseCount; //父类StateManagementDemo传过来的回调，改变ActionChip状态
//
//  Counter(this.count, this.increaseCount); //构造函数，从父类StateManagementDemo传过来
//
//  @override
//  Widget build(BuildContext context) {
//    return  Center(
////      child: Chip(
////        label: Text('$count'), //count是从父类StateManagementDemo中传过来的
////      ),
//      child: ActionChip( //可以添加动作
//        label: Text('$count'), //count是从父类StateManagementDemo中传过来的
//        onPressed: increaseCount,
//      ),
//    );
//  }
//}

//二、数据从StateManagementDemo传到CounterWrapper，再从父类CounterWrapper传过来
class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount; //父类StateManagementDemo传过来的回调，改变ActionChip状态

  Counter(this.count, this.increaseCount); //构造函数，从父类StateManagementDemo传过来

  @override
  Widget build(BuildContext context) {
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

