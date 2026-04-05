import 'package:flutter_commons/exceptions/security/security_error.dart';

final class SecurityException implements Exception {
  final SecurityError error;

  const SecurityException({required this.error});
}
