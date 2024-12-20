import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  /// Ejecuta el caso de uso para obtener un usuario por su id
  ///
  /// Parámetros:
  /// - [id]: ID del usuario a obtener
  ///
  /// Retorna [Either] con:
  /// - [Failure] en caso de error
  /// - [User] en caso de éxito
  Future<Either<Failure, User>> call(int id) async {
    return await repository.getUser(id);
  }
}
