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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gestión de Usuarios', style: theme.textTheme.h1),
              ShadButton(
                onPressed: () => _showUserDialog(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(LucideIcons.plus, size: 16),
                    ),
                    Text('Nuevo Usuario'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          BlocBuilder<UsersBloc, UsersState>(
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

              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: users.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ShadCard(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theme.colorScheme.primary,
                          child: Text(
                            user.name.substring(0, 1).toUpperCase(),
                            style: TextStyle(
                                color: theme.colorScheme.primaryForeground),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.name, style: theme.textTheme.large),
                              Text(user.email, style: theme.textTheme.muted),
                            ],
                          ),
                        ),
                        Container(
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
                        const SizedBox(width: 16),
                        ShadButton.ghost(
                          child: const Icon(LucideIcons.pencil, size: 16),
                          onPressed: () => _showUserDialog(context, user: user),
                        ),
                        ShadButton.ghost(
                          child: Icon(LucideIcons.trash2,
                              size: 16, color: theme.colorScheme.destructive),
                          onPressed: () {
                            context
                                .read<UsersBloc>()
                                .add(UsersDeleteRequested(id: user.id));
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
