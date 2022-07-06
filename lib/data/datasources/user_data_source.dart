import '../../domain/entities/user.dart';
import '../models/activity_model.dart';
import '../models/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getListUser();
  Future<UserModel> getUserById(int id);
  Future<List<ActivityModel>> getUserActivityHistory(int id);

  Future<bool> deleteUserById(int id);
  Future<UserModel> updateUser(User newUser);
}
