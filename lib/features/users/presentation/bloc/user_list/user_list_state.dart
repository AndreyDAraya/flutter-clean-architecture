import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {
  const UserListInitial();
}

class UserListLoading extends UserListState {
  const UserListLoading();
}

class UserListLoaded extends UserListState {
  final List<User> users;

  const UserListLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserListError extends UserListState {
  final String message;
  final int? code;

  const UserListError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}
