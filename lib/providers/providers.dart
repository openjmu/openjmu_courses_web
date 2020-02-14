///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 22:34
///
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:openjmu_courses_web/constants/constants.dart';

export 'package:provider/provider.dart';
export 'courses_provider.dart';
export 'date_provider.dart';
export 'themes_provider.dart';

ChangeNotifierProvider<T> buildProvider<T extends ChangeNotifier>(T value) {
  return ChangeNotifierProvider<T>.value(value: value);
}

List<SingleChildWidget> get builtProviders => _builtProviders;

final _builtProviders = <SingleChildWidget>[
  buildProvider<CoursesProvider>(CoursesProvider()),
  buildProvider<DateProvider>(DateProvider()),
  buildProvider<ThemesProvider>(ThemesProvider()),
];
