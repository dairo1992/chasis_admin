import 'package:app_core/utils/display_platform/display_platform.dart';
import 'package:app_core/utils/display_platform/display_platform_provider.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/admin_nav.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/layout/multi_target_layout.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/main_footer.dart';
import 'package:chasis_admin/core/ui/atomic/organisms/main_header.dart';
import 'package:chasis_admin/core/ui/models/admin_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Scaffold principal de la aplicación que unifica header, navegación,
/// body responsivo y footer en un solo componente reutilizable.
///
/// El [AdminNav] solo se renderiza si se proporcionan [navItems].
/// En desktop se muestra como sidebar lateral, en móvil como bottom nav.
///
/// Usa [headerExclusions] y [footerExclusions] para ocultar header/footer
/// en plataformas específicas (ej: pantalla de login).
///
/// Ejemplo de uso:
/// ```dart
/// AppScaffold(
///   body: MyContent(),
///   navItems: [AdminNavItem(id: 'home', icon: LucideIcons.home, label: 'Inicio')],
///   selectedNavId: 'home',
/// )
/// ```
class AppScaffold extends StatelessWidget {
  /// Contenido principal que ocupa el espacio restante.
  ///
  /// Se renderiza directamente si [desktopBody], [tabletBody] y [mobileBody]
  /// no son proporcionados.
  final Widget body;

  /// Contenido específico para desktop (pantallas grandes).
  /// Si es null, se usa [body].
  final Widget? desktopBody;

  /// Contenido específico para tablet (pantallas medianas).
  /// Si es null, se usa [body].
  final Widget? tabletBody;

  /// Contenido específico para mobile (pantallas pequeñas).
  /// Si es null, se usa [body].
  final Widget? mobileBody;

  /// Items de navegación del [AdminNav].
  /// Si es null o vacío, el nav no se renderiza.
  final List<AdminNavItem>? navItems;

  /// ID del item de navegación actualmente seleccionado.
  final String selectedNavId;

  /// Acciones adicionales para el header (botones en la barra superior).
  final List<ShadButton>? headerActions;

  /// Plataformas donde el header NO debe mostrarse.
  final List<DisplayPlatform> headerExclusions;

  /// Plataformas donde el footer NO debe mostrarse.
  final List<DisplayPlatform> footerExclusions;

  /// Widget de header personalizado. Por defecto usa [MainHeader].
  final Widget? header;

  /// Widget de footer personalizado. Por defecto usa [MainFooter].
  final Widget? footer;

  const AppScaffold({
    super.key,
    required this.body,
    this.desktopBody,
    this.tabletBody,
    this.mobileBody,
    this.navItems,
    this.selectedNavId = '',
    this.headerActions,
    this.headerExclusions = const [],
    this.footerExclusions = const [],
    this.header,
    this.footer,
  });

  bool get _hasNav => navItems != null && navItems!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final currentPlatform =
        DisplayPlatformProvider.instance.get().current;

    final showHeader = !headerExclusions.contains(currentPlatform);
    final showFooter = !footerExclusions.contains(currentPlatform);

    final headerWidget =
        header ?? MainHeader(actions: headerActions);
    final footerWidget = footer ?? const MainFooter();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (showHeader) headerWidget,
            Expanded(
              child: _buildBodyWithNav(context),
            ),
            if (showFooter) footerWidget,
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  /// Construye el body principal. En desktop, si hay items de nav,
  /// coloca el sidebar a la izquierda y el body a la derecha.
  /// En mobile/tablet, el body ocupa todo el espacio (el nav va abajo).
  Widget _buildBodyWithNav(BuildContext context) {
    final responsiveBody = MultiTargetLayout(
      desktop: () => desktopBody ?? body,
      tablet: () => tabletBody ?? body,
      mobile: () => mobileBody ?? body,
    );

    if (!_hasNav) return responsiveBody;

    // En desktop: sidebar + body. En mobile/tablet: solo body.
    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        final isDesktop =
            breakpoint >= ShadTheme.of(context).breakpoints.lg;

        if (isDesktop) {
          return Row(
            children: [
              AdminNav(
                items: navItems!,
                selectedId: selectedNavId,
              ),
              Expanded(child: responsiveBody),
            ],
          );
        }

        return responsiveBody;
      },
    );
  }

  /// Construye el bottom nav solo en mobile/tablet cuando hay items.
  Widget? _buildBottomNav(BuildContext context) {
    if (!_hasNav) return null;

    return ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        final isDesktop =
            breakpoint >= ShadTheme.of(context).breakpoints.lg;

        if (isDesktop) return const SizedBox.shrink();

        return AdminNav(
          items: navItems!,
          selectedId: selectedNavId,
        );
      },
    );
  }
}
