part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoaded extends ActivityState {
  final List<Activity> activities;
  const ActivityLoaded(this.activities);
  @override
  List<Object> get props => [activities];
}

class ActivityFilter extends ActivityState {
  final List<Activity> allData;
  final List<Activity> filterData;
  const ActivityFilter({required this.filterData, required this.allData});

  @override
  List<Object> get props => [allData, filterData];
}

class ActivityError extends ActivityState {
  final Failure failure;

  const ActivityError(this.failure);
  @override
  List<Object> get props => [failure];
}
