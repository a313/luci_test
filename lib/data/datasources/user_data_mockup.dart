import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entities/user.dart';
import '../models/activity_model.dart';
import '../models/user_model.dart';
import 'user_data_source.dart';

class UserDataSourceMockup implements UserDataSource {
  @override
  Future<List<UserModel>> getListUser() {
    // TODO: implement getListUser
    throw UnimplementedError();
  }

  @override
  Future<List<ActivityModel>> getUserActivityHistory(int id) async {
    final jsonStr = await rootBundle.loadString("assets/json/activities.json");
    final activityList = jsonDecode(jsonStr) as List;
    return activityList.map((e) => ActivityModel.fromMap(e)).toList();
  }

  @override
  Future<UserModel> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUserById(int id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser(User newUser) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
