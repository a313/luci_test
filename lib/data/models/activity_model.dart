import 'dart:convert';

import '../../domain/entities/activiy.dart';

class ActivityModel extends Activity {
  const ActivityModel(
      {required dynamic id, required DateTime time, required String action})
      : super(id: id, time: time, action: action);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time.millisecondsSinceEpoch,
      'action': action,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      action: map['action'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source));
}
