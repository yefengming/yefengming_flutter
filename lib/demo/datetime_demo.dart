import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //日期相关的sdk
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectedDate () async {  //获取选择的日期 //async标记为异步方法，await等待异步返回结果
    final DateTime date = await showDatePicker(  //日期选择器
        context: context,
        initialDate: selectedDate, //初始日期
        firstDate: DateTime(1900), //可以选择的最早日期
        lastDate: DateTime(2100)
    );

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectedTime() async { //获取选择的时间
    final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );

    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectedDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMd().format(selectedDate)), //日期格式化
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectedTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)), //日期格式化
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
