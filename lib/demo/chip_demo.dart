import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //超出一行自动换行
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Chip( //小碎片
//                  label: Text('Life'),
//                ),
//                SizedBox(width: 8.0,),
//                Chip(
//                  label: Text('Sunset'),
//                  backgroundColor: Colors.orange,
//                ),
//                SizedBox(width: 8.0,),
//                Chip(
//                  label: Text('Wanghao'),
//                  avatar: CircleAvatar(
//                    backgroundColor: Colors.grey,
//                    child: Text('浩'),
//                  ),
//                ),
//                SizedBox(width: 8.0,),
//                Chip(
//                  label: Text('Wanghao'),
//                  avatar: CircleAvatar(
//                    backgroundImage: NetworkImage(
//                      'http://pic39.nipic.com/20140320/12795880_110914420143_2.jpg',
//                    ),
//                    child: Text('浩'),
//                  ),
//                ),
//              ],
//            ),

            //超出一行自动换行
            Wrap(
              spacing: 8.0, //列间隔
              runSpacing: 8.0, //行间隔
              children: <Widget>[
                //一、普通碎片
                Chip( //小碎片
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('浩'),
                  ),
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'http://pic39.nipic.com/20140320/12795880_110914420143_2.jpg',
                    ),
                    child: Text('浩'),
                  ),
                ),
                Chip( //带删除功能的小碎片
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete), //删除图标
                  deleteIconColor: Colors.redAccent, //删除图标的颜色
                  deleteButtonTooltipMessage: 'Remove this tag', //长按删除按钮显示的文字
                ),

                //二、删除碎片
                Divider( //分隔符
                  color: Colors.grey,
                  height: 32.0, //分隔符高度
//                  indent: 32.0, //左边缩进
                ),
                Wrap( //加载一组小碎片
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),

                //三、动作碎片
                Divider( //分隔符
                  color: Colors.grey,
                  height: 32.0, //分隔符高度
//                  indent: 32.0, //左边缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap( //加载一组小碎片
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ActionChip( //动作碎片,可以带个动作
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),

                //四、过滤碎片,可以选中或者取消
                Divider( //分隔符
                  color: Colors.grey,
                  height: 32.0, //分隔符高度
//                  indent: 32.0, //左边缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected..toString()}'), //列表数据转为字符串
                ),
                Wrap( //加载一组小碎片
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return FilterChip( //动作碎片,可以带个动作
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                //五、选中碎片,类似单选按钮
                Divider( //分隔符
                  color: Colors.grey,
                  height: 12.0, //分隔符高度
//                  indent: 32.0, //左边缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'), //列表数据转为字符串
                ),
                Wrap( //加载一组小碎片
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ChoiceChip( //动作碎片,可以带个动作
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton( //重置
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
          });

          _selected = [];

          _choice = 'Lemon';
        },
      ),
    );
  }
}
