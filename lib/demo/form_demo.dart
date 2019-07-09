import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: ThemeDemo(), //用的颜色是主题颜色
      body: Theme(
//        data: ThemeData(  //重新设置颜色,替代之前的所有主题颜色
//          primaryColor: Colors.black,
//        ),
        data: Theme.of(context).copyWith( //只修改primaryColor
          primaryColor: Colors.black,
        ),
//        child: ThemeDemo(), //1.主题
        child: Container( //2.textField
           padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              TextFieldDemo(),  //textField
               RegisterForm(),  //一组表单
            ],
          ),
         ),
      ),
    );
  }
}


//form里包装一组表单字段，每个字段放在formField里
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String userName, passWord;

  void submitRegisterForm() {
    registerFormKey.currentState.save(); //执行保存方法
    registerFormKey.currentState.validate(); //执行验证方法

    debugPrint('username: $userName');
    debugPrint('password: $passWord');
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
            ),
            onSaved: (value) {
              userName = value;
            },
            validator: validateUsername, //验证
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '', //出现错误信息更自然些
            ),
            onSaved: (value) {
              passWord = value;
            },
            validator: validatePassword,
          ),
          SizedBox(height: 32.0,), //按钮上面的间距
          Container( //提交按钮
            width: double.infinity,
            child: RaisedButton( //按钮小部件
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white),),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}


//Stateful小部件
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    textEditingController.text = 'hi'; //设置初始值
    textEditingController.addListener(  //监听器
        () {
          debugPrint('input: ${textEditingController.text}');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
//      onChanged: (value) { //value表示文本框里有变化的值
//        debugPrint('input: $value');
//      },
      controller: textEditingController,
      onSubmitted: (value) { //按下确定按钮触发，value为文本框的值
        debugPrint('submit:$value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject), //文本框左边的小图标
        labelText: 'Title',
        hintText: 'Enter the post title', //提示文字
//        border: InputBorder.none, //没有边框
//        border: OutlineInputBorder(), //四周有边框
        filled: true,  //有背景颜色的文本框
      ),
    );
  }
}


class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Theme.of(context).primaryColor, //主题颜色，main.dart里设置的theme里的primarySwatch
        color: Theme.of(context).accentColor,  //使用Theme.of(context).copyWith，只改变primaryColor，不改变accentColor
    );
  }
}

