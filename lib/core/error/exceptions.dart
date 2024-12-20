class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException({
    required this.message,
    this.code,
  });
}

class CacheException implements Exception {
  final String message;
  final int? code;

  CacheException({
    required this.message,
    this.code,
  });
}

class NetworkException implements Exception {
  final String message;
  final int? code;

  NetworkException({
    required this.message,
    this.code,
  });
}

class ValidationException implements Exception {
  final String message;
  final int? code;

  ValidationException({
    required this.message,
    this.code,
  });
}
