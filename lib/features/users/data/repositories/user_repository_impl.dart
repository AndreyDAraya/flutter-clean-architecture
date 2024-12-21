import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers();
        await localDataSource.cacheUsers(remoteUsers);
        return Right(remoteUsers);
      } on ServerException catch (e) {
        try {
          final localUsers = await localDataSource.getCachedUsers();
          return Right(localUsers);
        } on CacheException catch (e) {
          return Left(CacheFailure(message: e.message));
        }
      }
    } else {
      try {
        final localUsers = await localDataSource.getCachedUsers();
        return Right(localUsers);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      }
    }
  }

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        try {
          final localUser = await localDataSource.getCachedUser(id);
          return Right(localUser);
        } on CacheException catch (e) {
          return Left(CacheFailure(message: e.message));
        }
      }
    } else {
      try {
        final localUser = await localDataSource.getCachedUser(id);
        return Right(localUser);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      }
    }
  }
}
