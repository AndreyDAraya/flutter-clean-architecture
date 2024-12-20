import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

class GetUsersEvent extends UserListEvent {
  const GetUsersEvent();
}

class RefreshUsersEvent extends UserListEvent {
  const RefreshUsersEvent();
}
