import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_users.dart';
import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUsers _getUsers;

  UserListBloc({
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        super(const UserListInitial()) {
    on<GetUsersEvent>(_onGetUsers);
    on<RefreshUsersEvent>(_onRefreshUsers);
  }

  Future<void> _onGetUsers(
    GetUsersEvent event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    final result = await _getUsers();
    result.fold(
      (failure) => emit(UserListError(
        message: failure.message,
        code: failure.code,
      )),
      (users) => emit(UserListLoaded(users: users)),
    );
  }

  Future<void> _onRefreshUsers(
    RefreshUsersEvent event,
    Emitter<UserListState> emit,
  ) async {
    final result = await _getUsers();
    result.fold(
      (failure) => emit(UserListError(
        message: failure.message,
        code: failure.code,
      )),
      (users) => emit(UserListLoaded(users: users)),
    );
  }
}
