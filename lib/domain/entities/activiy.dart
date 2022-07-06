import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final dynamic id;
  final DateTime time;
  final String action;
  const Activity({
    required this.id,
    required this.time,
    required this.action,
  });

  @override
  List<Object> get props => [id, time, action];
}
