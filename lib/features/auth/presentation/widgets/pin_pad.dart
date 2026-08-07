import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_spacing.dart';

/// Numeric keypad for PIN entry. Reports the current value via [onChanged]
/// on every keystroke; the parent screen decides when the value is long
/// enough to act on (PINs may be 4-6 digits).
class PinPad extends StatefulWidget {
  const PinPad({
    required this.onChanged,
    this.maxLength = AppConstants.maxPinLength,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final int maxLength;

  @override
  State<PinPad> createState() => PinPadState();
}

class PinPadState extends State<PinPad> {
  String _value = '';

  void clear() {
    setState(() => _value = '');
    widget.onChanged(_value);
  }

  void _append(String digit) {
    if (_value.length >= widget.maxLength) return;
    setState(() => _value += digit);
    widget.onChanged(_value);
  }

  void _backspace() {
    if (_value.isEmpty) return;
    setState(() => _value = _value.substring(0, _value.length - 1));
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.maxLength, (i) {
            final filled = i < _value.length;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: filled ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                  border: Border.all(color: colorScheme.outlineVariant),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppSpacing.xl),
        _keypadGrid(context),
      ],
    );
  }

  Widget _keypadGrid(BuildContext context) {
    const rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows
          .map((row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((key) => _keypadButton(context, key)).toList(),
              ))
          .toList(),
    );
  }

  Widget _keypadButton(BuildContext context, String key) {
    if (key.isEmpty) return const SizedBox(width: 72, height: 64);
    final isBackspace = key == '⌫';
    return SizedBox(
      width: 72,
      height: 64,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(36),
          onTap: isBackspace ? _backspace : () => _append(key),
          child: Center(
            child: isBackspace
                ? const Icon(Icons.backspace_outlined)
                : Text(key, style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
      ),
    );
  }
}
