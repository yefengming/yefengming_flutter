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

  ////Animation
  Animation animation;
  Animation animationColor;

  ////Curve动画曲线
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
//      value: 32.0, //初始值
//      lowerBound: 32.0, //最小值
//      upperBound: 100.0, //最大值
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );


    ////AnimatedWidget代替
//    animationDemoController.addListener(() {  //监听动画，动画有变化，执行setState，使用当前动画值重建小部件，可以把小部件放在可以把小部件放在AnimatedWidget，有变化时重建自己
////      print('${animationDemoController.value}');
//       setState(() {
//
//       });
//    });

//    animationDemoController.forward(); //开启动画

     animationDemoController.addStatusListener((AnimationStatus status) {
       print(status); //动画状态
     });


     ////设置动画范围值（数字、颜色）
//     animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
//     animationColor =
//         ColorTween(begin: Colors.red, end: Colors.red[900]).animate(animationDemoController);
     
     
     ////动画曲线
    curve = 
        CurvedAnimation(parent: animationDemoController, curve: Curves.bounceInOut);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);
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

//    return Center(
//        child: IconButton(
//          icon: Icon(Icons.favorite),
////          iconSize: animationDemoController.value,
//          iconSize: animation.value,
//          color: animationColor.value,
//          onPressed: () {
////            animationDemoController.forward();
//             switch (animationDemoController.status) {
//               case AnimationStatus.completed:
//                 animationDemoController.reverse(); //动画播放完成，倒退播放动画
//                 break;
//               default:
//                 animationDemoController.forward();
//             }
//          },
//        )
//    );

    ////AnimatedWidget
    return Center(
        child: AnimatedHeart(
          animations: [
            animation,
            animationColor,
          ],
          controller: animationDemoController,
        ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
//          iconSize: animationDemoController.value,
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
//            animationDemoController.forward();
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse(); //动画播放完成，倒退播放动画
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}

