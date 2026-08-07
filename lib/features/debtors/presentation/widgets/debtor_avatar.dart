import 'dart:io';

import 'package:flutter/material.dart';

class DebtorAvatar extends StatelessWidget {
  const DebtorAvatar({
    required this.fullName,
    this.photoPath,
    this.radius = 24,
    super.key,
  });

  final String fullName;
  final String? photoPath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (photoPath != null && File(photoPath!).existsSync()) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(File(photoPath!)),
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: colorScheme.primaryContainer,
      child: Text(
        _initials(fullName),
        style: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: radius * 0.7,
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }
}
