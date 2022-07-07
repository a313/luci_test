import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:luci_test/domain/entities/user.dart';
import 'package:luci_test/domain/usecases/get_user_list.dart';

import '../../../../core/error/failures.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserList getUserList;
  UserListBloc({required this.getUserList}) : super(UserListInitial()) {
    on<GetUserListEvent>(_getUserList);
  }

  Future<FutureOr<void>> _getUserList(
      GetUserListEvent event, Emitter<UserListState> emit) async {
    final result = await getUserList.call(NoParams());
    result.fold(
      (failure) => emit(UserListError(failure)),
      (user) => emit(UserListLoaded(user)),
    );
  }
}
