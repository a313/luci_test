part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class GetUserActivityHistoryEvent extends ActivityEvent {
  final int userId;

  const GetUserActivityHistoryEvent(this.userId);
}

class FilterActivityEvent extends ActivityEvent {
  final String action;
  final DateTime? startTime;
  final DateTime? endTime;
  const FilterActivityEvent(this.action, {this.startTime, this.endTime});
}
