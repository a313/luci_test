import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entities/user.dart';
import '../models/activity_model.dart';
import '../models/user_model.dart';
import 'user_data_source.dart';

class UserDataSourceMockup implements UserDataSource {
  @override
  Future<List<UserModel>> getListUser() async {
    final jsonStr = await rootBundle.loadString("assets/json/user.json");
    final userList = jsonDecode(jsonStr) as List;
    return userList.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<List<ActivityModel>> getUserActivityHistory(int id) async {
    final jsonStr = await rootBundle.loadString("assets/json/activities.json");
    final activityList = jsonDecode(jsonStr) as List;
    return activityList.map((e) => ActivityModel.fromMap(e)).toList();
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    final listUser = await getListUser();
    for (var user in listUser) {
      user.id == id;
      return user;
    }
    return null;
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
