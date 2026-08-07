import 'package:flutter/material.dart';

class BiometricPromptButton extends StatelessWidget {
  const BiometricPromptButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.fingerprint),
      label: const Text('Use biometrics'),
    );
  }
}
