import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserById implements UseCase<User, Params> {
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.getUserById(params.userId);
  }
}

class Params extends Equatable {
  final int userId;
  const Params({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
