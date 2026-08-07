import 'package:flutter/material.dart';

/// Constrains wide (tablet/desktop) layouts to a readable max width while
/// remaining full-bleed on phones.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    this.maxWidth = 840,
    super.key,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
