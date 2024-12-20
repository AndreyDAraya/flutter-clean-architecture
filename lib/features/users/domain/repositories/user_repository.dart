import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  /// Obtiene la lista de usuarios
  ///
  /// Retorna [Either] con:
  /// - [Failure] en caso de error
  /// - [List<User>] en caso de éxito
  Future<Either<Failure, List<User>>> getUsers();

  /// Obtiene un usuario por su id
  ///
  /// Retorna [Either] con:
  /// - [Failure] en caso de error
  /// - [User] en caso de éxito
  Future<Either<Failure, User>> getUser(int id);
}
