part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserByIdEvent extends UserEvent {
  final int userId;

  const GetUserByIdEvent(this.userId);
}

class UpdateUserEvent extends UserEvent {
  final User user;

  const UpdateUserEvent(this.user);
}

class DeleteUserEvent extends UserEvent {
  final User user;

  const DeleteUserEvent(this.user);
}
