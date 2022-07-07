import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luci_test/core/error/failures.dart';
import 'package:luci_test/domain/entities/user.dart';
import 'package:luci_test/domain/usecases/get_user_by_id.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserById getUserById;

  UserBloc({required this.getUserById}) : super(UserInitial()) {
    on<GetUserByIdEvent>(_getUserById);
  }

  Future<FutureOr<void>> _getUserById(
      GetUserByIdEvent event, Emitter<UserState> emit) async {
    final result = await getUserById.call(Params(userId: event.userId));
    result.fold(
      (failure) => emit(UserError(failure)),
      (user) => emit(UserLoaded(user)),
    );
  }
}
