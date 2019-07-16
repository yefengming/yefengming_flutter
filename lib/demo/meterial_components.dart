import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './checkbox_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
import './slider_demo.dart';
import './datetime_demo.dart';
import './simple_dialog_demo.dart';
import './alert_dialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snack_bar_demo.dart';
import './expansion_panel_demo.dart';
import './chip_demo.dart';
import './data_table_demo.dart';
import './paginated_data_table_demo.dart';
import './card_demo.dart';
import './stepper_demo.dart';

class MeterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: 'StepperDemo',
            page: StepperDemo(), // 步骤
          ),
          ListItem(
            title: 'CardDemo',
            page: CardDemo(), //卡片
          ),
          ListItem(
            title: 'PaginatedDataTable',
            page: PaginatedDataTableDemo(), //分页显示表格数据
          ),
          ListItem(
            title: 'DataTable',
            page: DataTableDemo(), //表格
          ),
          ListItem(
            title: 'Chip',
            page: ChipDemo(), //小碎片
          ),
          ListItem(
            title: 'ExpansionPanel',
            page: ExpansionPanelDemo(), //收缩面板
          ),
          ListItem(
            title: 'SnackBar',
            page: SnackBarDemo(), //短暂出现在屏幕底部,提示用户操作
          ),
          ListItem(
            title: 'BottomSheet',
            page: BottomSheetDemo(), //从屏幕底部滑动显示出来
          ),
          ListItem(
            title: 'AlertDialog',
            page: AlertDialogdDemo(), //提示对话框,确定/取消
          ),
          ListItem(
            title: 'SimpleDialog',
            page: SimpleDialogDemo(), //显示对话框
          ),
          ListItem(
            title: 'Datetime',
            page: DateTimeDemo(), //日期
          ),
          ListItem(
            title: 'Slider',
            page: SliderDemo(), //开关
          ),
          ListItem(
            title: 'Switch',
            page: SwitchDemo(), //开关
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(), //单选按钮
          ),
          ListItem(
            title: 'Checkbox',
            page: CheckboxDemo(), //复选框
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(), //表单
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(), //弹出式菜单按钮
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}

class _WidgeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
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

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page; //要打开的页面

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

