///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-14 11:46
///
class CurrentWeekUpdatedEvent {}

class CoursesLoadedEvent {}

class CourseScheduleRefreshEvent {}

class CoursePageShowWeekEvent {
  bool show;
  CoursePageShowWeekEvent(this.show);
}
