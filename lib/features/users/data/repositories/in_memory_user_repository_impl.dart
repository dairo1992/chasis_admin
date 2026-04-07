import 'package:chasis_admin/features/users/domain/entities/user_entity.dart';
import 'package:chasis_admin/features/users/domain/repositories/user_repository.dart';
import 'package:app_core/data/errors/app_exception.dart';

class InMemoryUserRepositoryImpl implements UserRepository {
  final List<UserEntity> _users = [
    const UserEntity(id: '1', name: 'Admin User', email: 'admin@admin.com', role: 'Administrador'),
    const UserEntity(id: '2', name: 'John Doe', email: 'john.doe@example.com', role: 'Operador'),
    const UserEntity(id: '3', name: 'Jane Smith', email: 'jane.smith@example.com', role: 'Visor', isActive: false),
  ];

  @override
  Future<List<UserEntity>> getUsers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    return List.unmodifiable(_users);
  }

  @override
  Future<UserEntity?> getUserById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _users.firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> createUser(UserEntity user) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (_users.any((u) => u.email == user.email)) {
      throw const BusinessException(message: 'El usuario ya existe');
    }
    _users.add(user);
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _users.indexWhere((element) => element.id == user.id);
    if (index >= 0) {
      _users[index] = user;
    } else {
      throw const NotFoundException(message: 'Usuario no encontrado');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _users.indexWhere((element) => element.id == id);
    if (index >= 0) {
      _users.removeAt(index);
    } else {
      throw const NotFoundException(message: 'Usuario no encontrado');
    }
  }
}
