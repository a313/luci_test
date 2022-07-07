part of 'user_list_bloc.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoaded extends UserListState {
  final List<User> userList;

  const UserListLoaded(this.userList);
}

class UserListError extends UserListState {
  final Failure failure;

  const UserListError(this.failure);
}
