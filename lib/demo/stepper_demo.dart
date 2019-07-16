import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) { //改变步骤的激活状态
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () { //按下continue到下一步
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () { //按下cancle到上一步
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('dajljf afkj a faldfj lkadjf akf ffffa kjd jklj jlj jklj'),
                    isActive: _currentStep == 0, //步骤激活状态
                  ),
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('dajljf afkj a  jlj jklj'),
                    isActive: _currentStep == 1, //步骤激活状态
                  ),
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('dajljf afkj a faldfklj jlj jklj'),
                    isActive: _currentStep == 2, //步骤激活状态
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
