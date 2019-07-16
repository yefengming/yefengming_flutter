import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _post = post;
  int _selectedCount = 0;

  @override
  int get rowCount => _post.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _post[index];

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  void _sort(getField(post), bool ascending) { //排序方法：第一个参数是方法参数
    _post.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners(); //排序完成执行
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex; //排序栏目的索引号
  bool _sortAscending = true; //排序方法升序/降序

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              source: _postDataSource,
              rowsPerPage: 5, //每页显示的行数
              sortColumnIndex: _sortColumnIndex, //需要排序的索引号
              sortAscending: _sortAscending, //true升序排列，false降序排列
              columns: [ //列
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnIndex, bool ascending) { //启动排序功能，按下栏目标签排序时执行
                    _postDataSource._sort((post) => post.title.length, ascending); //排序方法：参数是post，返回post.title.length

                    setState(() {
                      _sortColumnIndex = columnIndex; //排序的索引号
                      _sortAscending = ascending; //是否使用升序排列
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
