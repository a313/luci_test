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
}

class ActivityError extends ActivityState {
  final Failure failure;

  const ActivityError(this.failure);
}
