///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 22:47
///
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:openjmu_courses_web/constants/constants.dart';
import 'package:openjmu_courses_web/pages/course_schedule_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool firstFramed = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        firstFramed = true;
      });

      initProviders();

      Instances.eventBus.on<CoursesLoadedEvent>().listen((event) {
        navigatorState.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => CourseSchedulePage(key: Instances.courseSchedulePageStateKey),
          ),
          (route) => true,
        );
      });
    });
  }

  void initProviders() {
    Provider.of<CoursesProvider>(currentContext, listen: false).initCourses();
    Provider.of<DateProvider>(currentContext, listen: false).initCurrentWeek();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 500.milliseconds,
      opacity: firstFramed ? 1.0 : 0.0,
      child: Scaffold(
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
      ),
    );
  }
}
