import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: ShadTheme.of(context).colorScheme.primary,
    );
  }
}
