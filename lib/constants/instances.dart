///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 21:10
///
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:openjmu_courses_web/pages/course_schedule_page.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;
BuildContext get currentContext => navigatorState?.context;

class Instances {
  const Instances._();

  static final eventBus = EventBus();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final courseSchedulePageStateKey = GlobalKey<CourseSchedulePageState>();

  static String sid;
}
