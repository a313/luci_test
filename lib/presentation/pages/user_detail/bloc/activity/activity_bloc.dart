import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luci_test/core/error/failures.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/domain/entities/activiy.dart';

import '../../../../../domain/usecases/get_user_activity_history.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetUserActivityHistory getUserActivityHistory;

  ActivityBloc({required this.getUserActivityHistory})
      : super(ActivityInitial()) {
    on<GetUserActivityHistoryEvent>(_getUserActivityHistory);
    on<FilterActivityEvent>(_filterActivity);
  }

  Future<FutureOr<void>> _getUserActivityHistory(
      GetUserActivityHistoryEvent event, Emitter<ActivityState> emit) async {
    final result =
        await getUserActivityHistory.call(Params(userId: event.userId));
    result.fold(
      (failure) => emit(ActivityError(failure)),
      (activities) => emit(ActivityLoaded(activities)),
    );
  }

  FutureOr<void> _filterActivity(
      FilterActivityEvent event, Emitter<ActivityState> emit) {
    final searchValue = event.action;
    List<Activity> allData = [];
    if (state is ActivityLoaded) {
      allData = (state as ActivityLoaded).activities;
    } else if (state is ActivityFilter) {
      allData = (state as ActivityFilter).allData;
    }
    if (allData.isNotEmpty && searchValue.isNotEmpty) {
      final ActivityLoaded loadedState = (state as ActivityLoaded);
      final activities = loadedState.activities;
      final filterActivity = getMatchedActivities(activities, searchValue);
      emit(ActivityFilter(allData: allData, filterData: filterActivity));
    } else {
      emit(ActivityLoaded(allData));
    }
  }

  List<Activity> getMatchedActivities(
    List<Activity> activities,
    String searchValue,
  ) {
    List<Activity> filterActivity = [];
    for (var act in activities) {
      final s1 = act.action
          .nonAccentVietnamese()
          .withoutDiacriticalMarks
          .toLowerCase();
      final s2 = searchValue
          .nonAccentVietnamese()
          .withoutDiacriticalMarks
          .toLowerCase();

      if (s1.contains(s2)) filterActivity.add(act);
    }
    return filterActivity;
  }
}
