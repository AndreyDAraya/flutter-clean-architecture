import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../network/network_info.dart';
import '../../features/users/data/datasources/user_local_data_source.dart';
import '../../features/users/data/datasources/user_remote_data_source.dart';
import '../../features/users/data/local/database.dart';
import '../../features/users/data/repositories/user_repository_impl.dart';
import '../../features/users/domain/repositories/user_repository.dart';
import '../../features/users/domain/usecases/get_user.dart';
import '../../features/users/domain/usecases/get_users.dart';
import '../../features/users/presentation/bloc/user_detail/user_detail_bloc.dart';
import '../../features/users/presentation/bloc/user_list/user_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Users
  // Bloc
  sl.registerFactory(
    () => UserListBloc(getUsers: sl()),
  );
  sl.registerFactory(
    () => UserDetailBloc(getUser: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(database: sl()),
  );

  // Database
  sl.registerLazySingleton(() => AppDatabase());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  sl.registerLazySingleton(() => http.Client());
}
