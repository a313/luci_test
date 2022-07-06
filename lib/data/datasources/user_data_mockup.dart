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
  Future<List<ActivityModel>> getUserActivityHistory(int id) {
    // TODO: implement getUserActivityHistory
    throw UnimplementedError();
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
