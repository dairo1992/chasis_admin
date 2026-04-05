enum JwtValidationResult {
  isValid,
  needsRefresh,
  needsAnNewOne;

  bool get isOk => this == JwtValidationResult.isValid;
}
