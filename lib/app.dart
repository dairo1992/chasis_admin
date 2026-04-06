import 'package:app_core/utils/strings.dart';
import 'package:chasis_admin/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      appBuilder: (context) => MaterialApp.router(
        routerConfig: AppRouter.builRouter(),
        debugShowCheckedModeBanner: false,
        title: Strings.I.appName,
        theme: Theme.of(context),
        builder: (context, child) => ShadAppBuilder(child: child!),
      ),
    );
  }
}
