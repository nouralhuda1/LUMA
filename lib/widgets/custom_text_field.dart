
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      autocorrect: !isPassword && keyboardType == TextInputType.text,
      style: TextStyle(color: colors.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: colors.onSurface.withValues(alpha: 0.55),
        ),
        prefixIcon: Icon(
          icon,
          color: colors.primary,
        ),
      ),
    );
  }
}
