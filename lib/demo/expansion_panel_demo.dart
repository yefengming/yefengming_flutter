import 'package:flutter/material.dart';

class ExpansionPanelItem {  //表示收缩面板项目的类
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded
    ,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//  bool _isExpanded = false;
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList( //收缩面板

              //一个收缩项目
//              expansionCallback: (int panelIndex, bool isExpanded) { //面板的收起与展开：点按面板的控制按钮执行，被点的面板索引号/收缩状态
//                setState(() {
//                  _isExpanded = !_isExpanded;
//                });
//              },
//              children: [
//                ExpansionPanel( //每个收缩面板
//                  headerBuilder: (BuildContext context, bool isExpanded) { // 收缩面板头部,isExpanded收缩状态
//                    return Container(
//                      padding: EdgeInsets.all(16.0),
//                      child: Text(
//                        'Panel A',
//                        style: Theme.of(context).textTheme.title,
//                      ),
//                    );
//                  },
//                  body: Container(
//                    padding: EdgeInsets.all(16.0),
//                    width: double.infinity,
//                    child: Text('Content for Panel A'),
//                  ),
//                  isExpanded: _isExpanded,
//                ),
//              ],

               //多个收缩项目
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
//                  _isExpanded = !isExpanded;
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map(  //map 叠代处理列表项
                  (ExpansionPanelItem item) {  //叠代的项目
                    return ExpansionPanel(
                      isExpanded: item.isExpanded,
                      body: item.body,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headerText,
                            style: Theme.of(context).textTheme.title,
                          ),
                        );
                      },
                    );
                  }
              ).toList(), //转换成列表

            ),
          ],
        ),
      ),
    );
  }
}
