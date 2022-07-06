import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/activiy.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getListUser();
  Future<Either<Failure, User>> getUserById(int id);
  Future<Either<Failure, List<Activity>>> getUserActivityHistory(int id);
  Future<Either<Failure, bool>> deleteUserById(int id);
  Future<Either<Failure, User>> updateUser(User newUser);
}
