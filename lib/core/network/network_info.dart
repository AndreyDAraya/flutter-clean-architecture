abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // En una implementación real, aquí verificaríamos la conectividad
    // usando un package como connectivity_plus o internet_connection_checker
    return true;
  }
}

class NetworkConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const int timeoutDuration = 30000; // 30 segundos

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
