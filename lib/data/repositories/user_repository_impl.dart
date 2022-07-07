import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/activiy.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Activity>>> getUserActivityHistory(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final activityList = await dataSource.getUserActivityHistory(id);
        return Right(activityList);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await dataSource.getUserById(id);
        if (user != null) {
          return Right(user);
        } else {
          return Left(UserNotFoundFailure());
        }
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final state = await dataSource.deleteUserById(id);
        return Right(state);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getListUser() async {
    if (await networkInfo.isConnected) {
      try {
        final listUser = await dataSource.getListUser();
        return Right(listUser);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User newUser) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await dataSource.updateUser(newUser);
        return Right(user);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
