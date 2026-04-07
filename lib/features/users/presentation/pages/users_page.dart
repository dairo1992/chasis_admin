import 'package:app_core/utils/enums/display_target.dart';
import 'package:app_core/utils/extensions/context_display_target_extension.dart';
import 'package:chasis_admin/core/services/services_locator_impl.dart';
import 'package:chasis_admin/core/ui/templates/app_scaffold.dart';
import 'package:chasis_admin/features/users/domain/entities/user_entity.dart';
import 'package:chasis_admin/features/users/presentation/bloc/users_bloc.dart';
import 'package:chasis_admin/features/users/presentation/organisms/user_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:chasis_admin/core/ui/config/nav_items_config.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (context) => ServiceLocatorImpl.instance.get<UsersBloc>()
        ..add(const UsersLoadStarted()),
      child: const _UsersView(),
    );
  }
}

class _UsersView extends StatelessWidget {
  const _UsersView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      navItems: getAdminNavItems(context),
      selectedNavId: 'users',
      body: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {
          if (state is UsersOperationSuccess) {
            ShadToaster.of(context).show(
              ShadToast(
                title: const Text('Éxito'),
                description: Text(state.message),
              ),
            );
          } else if (state is UsersOperationFailure) {
            ShadToaster.of(context).show(
              ShadToast.destructive(
                title: const Text('Error'),
                description: Text(state.message),
              ),
            );
          }
        },
        child: const _UsersBody(),
      ),
    );
  }
}

class _UsersBody extends StatelessWidget {
  const _UsersBody();

  void _showUserDialog(BuildContext context, {UserEntity? user}) {
    showShadDialog(
      context: context,
      builder: (_) {
        return ShadDialog(
          title: Text(user == null ? 'Nuevo Usuario' : 'Editar Usuario'),
          child: UserFormWidget(
            user: user,
            onSave: (newUser) {
              if (user == null) {
                context
                    .read<UsersBloc>()
                    .add(UsersCreateRequested(user: newUser));
              } else {
                context
                    .read<UsersBloc>()
                    .add(UsersUpdateRequested(user: newUser));
              }
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, UserEntity user) async {
    final confirmed = await showShadDialog<bool>(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('¿Estás seguro?'),
        description: const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            'Esta acción no se puede deshacer. Esto eliminará permanentemente al usuario y removerá sus datos de nuestros servidores.',
          ),
        ),
        actions: [
          ShadButton.outline(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            child: const Text('Continuar'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<UsersBloc>().add(UsersDeleteRequested(id: user.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gestión de Usuarios.',
                style: theme.textTheme.h1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              ShadButton(
                onPressed: () => _showUserDialog(context),
                leading: const Icon(LucideIcons.plus, size: 16),
                child: (context.displayTarget != DisplayTarget.mobile)
                    ? const Text('Nuevo Usuario')
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersLoadInProgress || state is UsersInitial) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is UsersLoadFailure) {
                  return Center(
                    child: Text('Error: ${state.message}',
                        style: TextStyle(color: theme.colorScheme.destructive)),
                  );
                }

                final users = (state is UsersLoadSuccess)
                    ? state.users
                    : (state as dynamic).users ?? <UserEntity>[];

                if (users.isEmpty) {
                  return const Center(
                    child: Text('No hay usuarios registrados.'),
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final availableWidth = constraints.maxWidth;
                    return ShadTable.list(
                      columnSpanExtent: (index) {
                        switch (index) {
                          case 0:
                            return const FixedTableSpanExtent(80); // Perfil
                          case 1:
                            return FixedTableSpanExtent(
                                (availableWidth - 80 - 150 - 150)
                                    .clamp(100.0, double.infinity)); // Datos
                          case 2:
                            return const FixedTableSpanExtent(150); // Rol
                          case 3:
                            return const FixedTableSpanExtent(150); // Acciones
                          default:
                            return null;
                        }
                      },
                      header: const [
                        ShadTableCell.header(child: Text('Perfil')),
                        ShadTableCell.header(child: Text('Datos')),
                        ShadTableCell.header(child: Text('Rol')),
                        ShadTableCell.header(child: Text('Acciones')),
                      ],
                      children: users.map<Iterable<ShadTableCell>>((user) {
                        return <ShadTableCell>[
                          ShadTableCell(
                            child: CircleAvatar(
                              backgroundColor: theme.colorScheme.primary,
                              child: Text(
                                user.name.substring(0, 1).toUpperCase(),
                                style: TextStyle(
                                    color: theme.colorScheme.primaryForeground),
                              ),
                            ),
                          ),
                          ShadTableCell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user.name,
                                  style: theme.textTheme.large,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  user.email,
                                  style: theme.textTheme.muted,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          ShadTableCell(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                user.role,
                                style: theme.textTheme.small.copyWith(
                                  fontSize: 10,
                                  color: theme.colorScheme.secondaryForeground,
                                ),
                              ),
                            ),
                          ),
                          ShadTableCell(
                            child: Row(
                              children: [
                                ShadButton.ghost(
                                  child:
                                      const Icon(LucideIcons.pencil, size: 16),
                                  onPressed: () =>
                                      _showUserDialog(context, user: user),
                                ),
                                ShadButton.ghost(
                                  child: Icon(LucideIcons.trash2,
                                      size: 16,
                                      color: theme.colorScheme.destructive),
                                  onPressed: () =>
                                      _confirmDelete(context, user),
                                ),
                              ],
                            ),
                          ),
                        ];
                      }).toList(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
