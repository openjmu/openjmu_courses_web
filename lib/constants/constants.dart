///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 21:11
///
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

export 'package:http/http.dart' show Response;
export 'package:dartx/dartx.dart';
export 'package:provider/provider.dart';

export 'events.dart';
export 'instances.dart';
export 'screens.dart';
export 'widgets.dart';

export '../api/api.dart';
export '../models/models.dart';
export '../providers/providers.dart';
export '../utils/utils.dart';

const double kAppBarHeight = 75.0;
const defaultColor = Color(0xFFE5322D);
Color get currentThemeColor => defaultColor;

class Constants {
  const Constants._();

  static Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static Iterable<Locale> get supportedLocales => [
        const Locale.fromSubtags(languageCode: 'zh'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'),
      ];
}
