import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validators.dart';

class AmountInputField extends StatelessWidget {
  const AmountInputField({
    required this.controller,
    this.label = 'Amount',
    this.autofocus = false,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.payments_outlined),
      ),
      validator: Validators.amount,
    );
  }
}
