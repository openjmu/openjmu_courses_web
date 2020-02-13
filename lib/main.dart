// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'package:openjmu_courses_web/constants/constants.dart';
import 'package:openjmu_courses_web/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initSid() {
    Instances.sid = Uri.tryParse(js.context['location']['href'])?.queryParameters['sid'];
    if (Instances.sid != null) providers.addAll(builtProviders);
  }

  @override
  void initState() {
    super.initState();
    initSid();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashPage(),
      ),
    );
  }
}
