import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'yefengming_demo_messages_all.dart';

//定义需要翻译的信息
class YefengmingDemoLocalizations {
  static YefengmingDemoLocalizations of(BuildContext context) {
    return Localizations.of<YefengmingDemoLocalizations>(
      context,
      YefengmingDemoLocalizations,
    );
  }

  static Future<YefengmingDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return YefengmingDemoLocalizations();
    });
  }

  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations.',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone',
    args: [name],
  );
}

class YefengmingDemoLocalizationsDelegate extends LocalizationsDelegate<YefengmingDemoLocalizations> {
  YefengmingDemoLocalizationsDelegate(); //构造方法

  @override
  Future<YefengmingDemoLocalizations> load(Locale locale) {
    return YefengmingDemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) { //类的load方法加载的本地化资源是否支持指定的本地化语言
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<YefengmingDemoLocalizations> old) { //true调用load重新加载
    return false;
  }
}

//生成dart文件：flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=yefengming_demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/yefengming_demo_localizations.dart lib/demo/i18n/intl/intl_*.arb

