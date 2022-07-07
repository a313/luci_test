import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserList implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetUserList(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repository.getListUser();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
