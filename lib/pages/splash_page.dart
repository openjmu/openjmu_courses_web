///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 22:47
///
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:openjmu_courses_web/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  void navigate() {
//    NetUtils.fetch(FetchType.get, uri: API.courseBySid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Schedule Web')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Selector<DateProvider, DateTime>(
              selector: (_, provider) => provider.startDate,
              builder: (_, startDate, __) {
                return Text('Start date: $startDate');
              },
            ),
          ],
        ),
      ),
    );
  }
}
