import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  /// Ejecuta el caso de uso para obtener la lista de usuarios
  ///
  /// Retorna [Either] con:
  /// - [Failure] en caso de error
  /// - [List<User>] en caso de éxito
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUsers();
  }
}
