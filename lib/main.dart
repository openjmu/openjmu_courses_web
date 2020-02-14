// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'package:openjmu_courses_web/constants/constants.dart';
import 'package:openjmu_courses_web/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void initSid() {
    debugPrint('Initing SID...');
    Instances.sid = Uri.tryParse(js.context['location']['href'])?.queryParameters['sid'];
    if (Instances.sid != null) debugPrint('Got SID: ${Instances.sid}');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: builtProviders,
      child: Consumer<ThemesProvider>(
        builder: (_, provider, __) {
          return Theme(
            data: provider.lightTheme,
            child: OKToast(
              child: MaterialApp(
                title: '课程表',
                navigatorKey: Instances.navigatorKey,
                theme: provider.lightTheme,
                home: SplashPage(),
                builder: (c, w) {
                  initSid();
                  return w;
                },
                localizationsDelegates: Constants.localizationsDelegates,
                supportedLocales: Constants.supportedLocales,
              ),
            ),
          );
        },
      ),
    );
  }
}
