import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

//定义本地化资源类
class YefengmingDemoLocalizations {
  final Locale locale;

  YefengmingDemoLocalizations(this.locale);

  static YefengmingDemoLocalizations of(BuildContext context) {
    return Localizations.of<YefengmingDemoLocalizations>(
        context,
        YefengmingDemoLocalizations,
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class YefengmingDemoLocalizationsDelegate extends LocalizationsDelegate<YefengmingDemoLocalizations> {
  YefengmingDemoLocalizationsDelegate(); //构造方法

  @override
  Future<YefengmingDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<YefengmingDemoLocalizations>(
      YefengmingDemoLocalizations(locale),
    );
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