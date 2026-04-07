import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:chasis_admin/features/users/domain/entities/user_entity.dart';

class UserFormWidget extends StatefulWidget {
  final UserEntity? user;
  final void Function(UserEntity) onSave;

  const UserFormWidget({
    super.key,
    this.user,
    required this.onSave,
  });

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final _formKey = GlobalKey<ShadFormState>();
  late String _name;
  late String _email;
  late String _role;
  late bool _isActive;

  final List<String> _roles = ['Administrador', 'Operador', 'Visor'];

  @override
  void initState() {
    super.initState();
    _name = widget.user?.name ?? '';
    _email = widget.user?.email ?? '';
    _role = widget.user?.role ?? _roles.first;
    _isActive = widget.user?.isActive ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ShadInputFormField(
            id: 'name',
            initialValue: _name,
            label: const Text('Nombre'),
            placeholder: const Text('John Doe'),
            validator: (v) {
              if (v.isEmpty) return 'El nombre es requerido';
              return null;
            },
            onSaved: (v) => _name = v ?? '',
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            id: 'email',
            initialValue: _email,
            label: const Text('Correo Electrónico'),
            placeholder: const Text('user@example.com'),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v.isEmpty) return 'El correo es requerido';
              if (!v.contains('@')) return 'Correo no válido';
              return null;
            },
            onSaved: (v) => _email = v ?? '',
          ),
          const SizedBox(height: 16),
          ShadSelectFormField<String>(
            id: 'role',
            label: const Text('Rol'),
            initialValue: _role,
            onChanged: (v) {
              if (v != null) setState(() => _role = v);
            },
            options: _roles
                .map((r) => ShadOption(value: r, child: Text(r)))
                .toList(),
            selectedOptionBuilder: (context, value) => Text(value),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ShadSwitch(
                value: _isActive,
                onChanged: (v) => setState(() => _isActive = v),
              ),
              const SizedBox(width: 8),
              const Text('Activo'),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.outline(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 8),
              ShadButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final id = widget.user?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
                    final newUser = UserEntity(
                      id: id,
                      name: _name,
                      email: _email,
                      role: _role,
                      isActive: _isActive,
                    );
                    widget.onSave(newUser);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
