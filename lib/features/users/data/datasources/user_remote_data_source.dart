import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  /// Obtiene la lista de usuarios de la API
  ///
  /// Lanza [ServerException] si hay un error en el servidor
  Future<List<UserModel>> getUsers();

  /// Obtiene un usuario por su id de la API
  ///
  /// Lanza [ServerException] si hay un error en el servidor
  Future<UserModel> getUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await client
          .get(
            Uri.parse('${NetworkConstants.baseUrl}/users'),
            headers: NetworkConstants.headers,
          )
          .timeout(
            const Duration(milliseconds: NetworkConstants.timeoutDuration),
          );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          message: 'Error al obtener usuarios',
          code: response.statusCode,
        );
      }
    } catch (e) {
      throw ServerException(
        message: 'Error de conexión al obtener usuarios',
      );
    }
  }

  @override
  Future<UserModel> getUser(int id) async {
    try {
      final response = await client
          .get(
            Uri.parse('${NetworkConstants.baseUrl}/users/$id'),
            headers: NetworkConstants.headers,
          )
          .timeout(
            const Duration(milliseconds: NetworkConstants.timeoutDuration),
          );

      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException(
          message: 'Error al obtener usuario',
          code: response.statusCode,
        );
      }
    } catch (e) {
      throw ServerException(
        message: 'Error de conexión al obtener usuario',
      );
    }
  }
}
