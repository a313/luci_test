import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final int id;
  const Activity({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
