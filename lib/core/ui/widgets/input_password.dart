import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadInputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? placeholder;
  final ValueChanged<String>? onChanged;

  const ShadInputPassword({
    super.key,
    this.controller,
    this.placeholder,
    this.onChanged,
  });

  @override
  State<ShadInputPassword> createState() => _ShadInputPasswordState();
}

class _ShadInputPasswordState extends State<ShadInputPassword> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return ShadInput(
      controller: widget.controller,
      onChanged: widget.onChanged,
      placeholder: widget.placeholder ?? const Text('Contraseña'),
      obscureText: obscure,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(LucideIcons.lock, size: 16),
      ),
      trailing: ShadIconButton.ghost(
        width: 24,
        height: 24,
        padding: EdgeInsets.zero,
        icon: Icon(
          obscure ? LucideIcons.eyeOff : LucideIcons.eye,
          size: 16,
        ),
        onPressed: () {
          setState(() => obscure = !obscure);
        },
      ),
    );
  }
}
