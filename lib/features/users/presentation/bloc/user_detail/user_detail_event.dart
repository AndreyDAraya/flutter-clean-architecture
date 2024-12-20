import 'package:equatable/equatable.dart';

abstract class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetUserDetailEvent extends UserDetailEvent {
  final int userId;

  const GetUserDetailEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class RefreshUserDetailEvent extends UserDetailEvent {
  final int userId;

  const RefreshUserDetailEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
