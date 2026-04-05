class LoginFormUiModel {
  final String email;
  final String password;
  final bool rememberMe;

  LoginFormUiModel({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  factory LoginFormUiModel.initial() =>
      LoginFormUiModel(email: '', password: '', rememberMe: false);

  LoginFormUiModel copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    bool? isLoading,
  }) => LoginFormUiModel(
    email: email ?? this.email,
    password: password ?? this.password,
    rememberMe: rememberMe ?? this.rememberMe,
  );
}
