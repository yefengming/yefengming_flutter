import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('PadioGroupValue: $_radioGroupA'),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text('Options A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 0, //是否让文字和图标激活
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text('Options B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroupA == 1, //是否让文字和图标激活
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Radio( //单选按钮
//                  value: 0,
//                  groupValue: _radioGroupA,
//                  onChanged: _handleRadioValueChanged,
//                  activeColor: Colors.black,
//                ),
//                Radio(
//                  value: 1,
//                  groupValue: _radioGroupA,
//                  onChanged: _handleRadioValueChanged,
//                  activeColor: Colors.black,
//                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
