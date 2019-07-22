import 'package:flutter/material.dart';
import 'package:yefengming_flutter/demo/i18n/map/yefengming_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text('${locale.languageCode}'),//zh
            Text(locale.toString()), //zh_CN
            Text(
//              Localizations.of(context, YefengmingDemoLocalizations).title, //在本地资源类中添加static方法
              YefengmingDemoLocalizations.of(context).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
