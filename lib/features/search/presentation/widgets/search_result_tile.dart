import 'package:flutter/material.dart';

import '../../../debtors/domain/entities/debtor.dart';
import '../../../debtors/presentation/widgets/debtor_avatar.dart';

class DebtorSearchResultTile extends StatelessWidget {
  const DebtorSearchResultTile({required this.debtor, required this.onTap, super.key});

  final Debtor debtor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DebtorAvatar(fullName: debtor.fullName, photoPath: debtor.photoPath, radius: 20),
      title: Text(debtor.fullName),
      subtitle: Text([debtor.nickname, debtor.mobile].whereType<String>().join(' · ')),
      onTap: onTap,
    );
  }
}
