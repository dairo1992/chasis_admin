final class AppException implements Exception {
  final String message;
  final String code;
  final StackTrace? stackTrace;

  const AppException({
    this.message = 'An unknown error occurred.',
    this.stackTrace,
    this.code = '',
  });

  @override
  String toString() {
    return 'AppException: $message';
  }
}
