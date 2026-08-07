import 'package:flutter/material.dart';

import 'empty_state.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.error_outline,
      title: 'Something went wrong',
      message: message,
      action: onRetry == null
          ? null
          : FilledButton.tonal(
              onPressed: onRetry,
              child: const Text('Try again'),
            ),
    );
  }
}
