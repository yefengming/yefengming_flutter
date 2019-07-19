import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
  with TickerProviderStateMixin {
  AnimationController animationDemoController;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      value: 32.0, //初始值
      lowerBound: 32.0, //最小值
      upperBound: 100.0, //最大值
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    animationDemoController.addListener(() {
//      print('${animationDemoController.value}');
       setState(() {

       });
    });

//    animationDemoController.forward(); //开启动画

     animationDemoController.addStatusListener((AnimationStatus status) {
       print(status); //动画状态
     });
  }

  @override
  void dispose() {
    super.dispose();

    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Center(
//      child: ActionChip(
//        label: Text('${animationDemoController.value}'),
//        onPressed: () {
//           animationDemoController.forward();
//        },
//      )
//    );

    return Center(
        child: IconButton(
          icon: Icon(Icons.favorite),
          iconSize: animationDemoController.value,
          onPressed: () {
//            animationDemoController.forward();
             switch (animationDemoController.status) {
               case AnimationStatus.completed:
                 animationDemoController.reverse(); //动画播放完成，倒退播放动画
                 break;
               default:
                 animationDemoController.forward();
             }
          },
        )
    );
  }
}
