import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luci_test/domain/entities/activiy.dart';

import '../../core/error/failures.dart';
import '../../domain/usecases/get_user_activity_history.dart';

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
      FilterActivityEvent event, Emitter<ActivityState> emit) {}
}
