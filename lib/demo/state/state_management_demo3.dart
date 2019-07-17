import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CountModel(), ////model,用StatelessWidget
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CountModel>(
          rebuildOnChange: false, ////model变化时不需要重建FloatingActionButton小部件的漂浮按钮
          builder: (context, _, model) => FloatingActionButton( ////_是可选的子部件
            child: Icon(Icons.add),
            onPressed: model.increaseCount, ////使用model
          ),
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
    return ScopedModelDescendant<CountModel>(
      builder: (context, _, model) => ActionChip( //可以添加动作
        label: Text('${model.count}'),  ////使用model
        onPressed: model.increaseCount,
      ),
    );
  }
}

class CountModel extends Model { ////创建model
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
