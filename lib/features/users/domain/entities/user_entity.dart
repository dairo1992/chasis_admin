class UserEntity {
  final String id;
  final String name;
  final String email;
  final String role;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.isActive = true,
  });

  UserEntity copyWith({
    String? name,
    String? email,
    String? role,
    bool? isActive,
  }) {
    return UserEntity(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
    );
  }
}
