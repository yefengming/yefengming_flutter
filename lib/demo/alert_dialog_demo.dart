import 'package:flutter/material.dart';
import 'dart:async';

enum Action {
  ok,
  cancle
}

class AlertDialogdDemo extends StatefulWidget {
  @override
  _AlertDialogdDemoState createState() => _AlertDialogdDemoState();
}

class _AlertDialogdDemoState extends State<AlertDialogdDemo> {
  String _choice = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog( //获取动作的值
      context: context,
      barrierDismissible: false, //必须选择cancle或者ok之后才能关掉对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('cancle'),
              onPressed: () {
                Navigator.pop(context, Action.cancle);
              },
            ),
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.pop(context, Action.ok);
              },
            ),
          ],
        );
      },
    );

    switch (action) { //使用动作的值
      case Action.ok:
        setState(() {
          _choice = 'ok';
        });
        break;
      case Action.cancle:
        setState(() {
          _choice = 'cancle';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogdDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
