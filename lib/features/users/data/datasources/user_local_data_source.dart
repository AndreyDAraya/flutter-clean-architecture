import 'package:drift/drift.dart';
import '../../../../core/error/exceptions.dart';
import '../local/database.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  /// Gets the cached list of [UserModel]
  ///
  /// Throws [CacheException] if no cached data is present
  Future<List<UserModel>> getCachedUsers();

  /// Gets the cached [UserModel] for the provided id
  ///
  /// Throws [CacheException] if no cached data is present
  Future<UserModel> getCachedUser(int id);

  /// Caches the provided [UserModel] list
  Future<void> cacheUsers(List<UserModel> usersToCache);

  /// Caches the provided [UserModel]
  Future<void> cacheUser(UserModel userToCache);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppDatabase database;

  UserLocalDataSourceImpl({required this.database});

  @override
  Future<List<UserModel>> getCachedUsers() async {
    try {
      final users = await database.getAllUsers();
      return users
          .map((user) => UserModel(
                id: user.id,
                name: user.name,
                email: user.email,
                phone: user.phone,
                website: user.website,
                company: user.company,
              ))
          .toList();
    } catch (e) {
      throw CacheException(message: 'No hay datos en caché');
    }
  }

  @override
  Future<UserModel> getCachedUser(int id) async {
    try {
      final user = await database.getUser(id);
      if (user != null) {
        return UserModel(
          id: user.id,
          name: user.name,
          email: user.email,
          phone: user.phone,
          website: user.website,
          company: user.company,
        );
      }
      throw CacheException(message: 'Usuario no encontrado en caché');
    } catch (e) {
      throw CacheException(message: 'Error al obtener usuario de caché');
    }
  }

  @override
  Future<void> cacheUsers(List<UserModel> usersToCache) async {
    try {
      final userCompanions = usersToCache
          .map((user) => UsersCompanion(
                id: Value(user.id),
                name: Value(user.name),
                email: Value(user.email),
                phone: Value(user.phone),
                website: Value(user.website),
                company: Value(user.company),
              ))
          .toList();

      await database.insertUsers(userCompanions);
    } catch (e) {
      throw CacheException(message: 'Error al guardar usuarios en caché');
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    try {
      await database.insertUser(UsersCompanion(
        id: Value(userToCache.id),
        name: Value(userToCache.name),
        email: Value(userToCache.email),
        phone: Value(userToCache.phone),
        website: Value(userToCache.website),
        company: Value(userToCache.company),
      ));
    } catch (e) {
      throw CacheException(message: 'Error al guardar usuario en caché');
    }
  }
}
