import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object?> get props => [];
}

class UserDetailInitial extends UserDetailState {
  const UserDetailInitial();
}

class UserDetailLoading extends UserDetailState {
  const UserDetailLoading();
}

class UserDetailLoaded extends UserDetailState {
  final User user;

  const UserDetailLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserDetailError extends UserDetailState {
  final String message;
  final int? code;

  const UserDetailError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}
