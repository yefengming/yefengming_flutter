import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex; //排序栏目的索引号
  bool _sortAscending = true; //排序方法升序/降序

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex, //需要排序的索引号
              sortAscending: _sortAscending, //true升序排列，false降序排列
//              onSelectAll: (bool value) {}, //全选
              columns: [ //列
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnIndex, bool ascending) { //启动排序功能，按下栏目标签排序时执行
                    setState(() {
                      _sortColumnIndex = columnIndex; //排序的索引号
                      _sortAscending = ascending; //是否使用升序排列

                      post.sort((a, b) { //排序功能
                        if (!_sortAscending) { //排序方法不是_sortAscending，调换a和b
                          final c = a;
                          a = b;
                          b = c;
                        }

                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
//                  label: Container( //单独设置宽度
//                    width: 150.0,
//                    child: Text('Title'),
//                  ),
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              
              //一、手动设置rows
//              rows: [ //行
//                DataRow(
//                  cells: [
//                    DataCell(Text('hello~')),
//                    DataCell(Text('wanghao')),
//                  ]
//                ),
//                DataRow(
//                    cells: [
//                      DataCell(Text('holl~')),
//                      DataCell(Text('wanghao')),
//                    ]
//                ),
//                DataRow(
//                    cells: [
//                      DataCell(Text('您好~')),
//                      DataCell(Text('wanghao')),
//                    ]
//                ),
//              ],
              
              //二、用列表生成的数据表格
              rows: post.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) { //value当前行的选择状态
                    setState(() {
                      if (post.selected != value) {
                        post.selected = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ]
                );
              }).toList(),  //将数据转为list
            ),
          ],
        ),
      ),
    );
  }
}
