import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_user.dart';
import 'user_detail_event.dart';
import 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUser _getUser;

  UserDetailBloc({
    required GetUser getUser,
  })  : _getUser = getUser,
        super(const UserDetailInitial()) {
    on<GetUserDetailEvent>(_onGetUserDetail);
    on<RefreshUserDetailEvent>(_onRefreshUserDetail);
  }

  Future<void> _onGetUserDetail(
    GetUserDetailEvent event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(const UserDetailLoading());
    final result = await _getUser(event.userId);
    result.fold(
      (failure) => emit(UserDetailError(
        message: failure.message,
        code: failure.code,
      )),
      (user) => emit(UserDetailLoaded(user: user)),
    );
  }

  Future<void> _onRefreshUserDetail(
    RefreshUserDetailEvent event,
    Emitter<UserDetailState> emit,
  ) async {
    final result = await _getUser(event.userId);
    result.fold(
      (failure) => emit(UserDetailError(
        message: failure.message,
        code: failure.code,
      )),
      (user) => emit(UserDetailLoaded(user: user)),
    );
  }
}
