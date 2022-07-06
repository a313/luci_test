import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class GetUserActivityHistory implements UseCase<List<Activity>, Params> {
  final UserRepository repository;

  GetUserActivityHistory(this.repository);

  @override
  Future<Either<Failure, List<Activity>>> call(Params params) async {
    return await repository.getUserActivityHistory(params.userId);
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
