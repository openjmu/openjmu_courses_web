///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 21:10
///
import 'package:flutter/material.dart';

NavigatorState get navigatorState => Instances.navigatorKey.currentState;
BuildContext get currentContext => navigatorState.context;

class Instances {
  const Instances._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static String sid;
}
