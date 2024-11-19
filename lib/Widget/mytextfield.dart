import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final bool isPassword;
  final bool isObscure;
  final VoidCallback? toggleVisibility;

  const MyTextfield({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.isPassword = false,
    this.isObscure = false,
    this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: isPassword && isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleVisibility,
              )
            : null,
      ),
    );
  }
}