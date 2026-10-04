class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class DatabaseException extends AppException {
  const DatabaseException(super.message);
}

class OfflineException extends AppException {
  const OfflineException()
      : super('Sem conexão com a internet. Usando dados em cache.');
}
