import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../domain/entities/auth_state.dart';
import '../providers/auth_providers.dart';
import '../widgets/pin_pad.dart';

class UnlockScreen extends ConsumerStatefulWidget {
  const UnlockScreen({super.key});

  @override
  ConsumerState<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends ConsumerState<UnlockScreen> {
  bool _usePassword = false;
  String _pin = '';
  String? _error;
  bool _isVerifying = false;
  final _passwordController = TextEditingController();
  final _pinPadKey = GlobalKey<PinPadState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeTryBiometric());
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _maybeTryBiometric() async {
    final authState = ref.read(authControllerProvider);
    if (!authState.biometricEnabled || authState.isLockedOut) return;
    final success = await ref.read(authControllerProvider.notifier).unlockWithBiometrics();
    if (!success && mounted) {
      // Silently fall back to PIN entry — no need to surface an error for a
      // cancelled/failed biometric prompt.
    }
  }

  Future<void> _submitPin(String pin) async {
    setState(() => _isVerifying = true);
    final success = await ref.read(authControllerProvider.notifier).unlockWithPin(pin);
    if (!mounted) return;
    setState(() => _isVerifying = false);
    if (!success) {
      setState(() => _error = 'Incorrect PIN');
      _pinPadKey.currentState?.clear();
      ref.invalidate(authControllerProvider);
    }
  }

  Future<void> _submitPassword() async {
    setState(() => _isVerifying = true);
    final success =
        await ref.read(authControllerProvider.notifier).unlockWithPassword(_passwordController.text);
    if (!mounted) return;
    setState(() => _isVerifying = false);
    if (!success) {
      setState(() => _error = 'Incorrect password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLockedOut = authState.isLockedOut;

    return Scaffold(
      body: SafeArea(
        child: AppScaffold(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.xxl),
                Icon(Icons.lock_outline, size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: AppSpacing.md),
                Text('Debt Ledger is locked', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.xl),
                if (isLockedOut)
                  Text(
                    'Too many failed attempts. Try again in ${authState.lockoutRemaining!.inSeconds}s.',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      child: _usePassword ? _buildPasswordEntry() : _buildPinEntry(authState),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinEntry(AuthState authState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinPad(
          key: _pinPadKey,
          onChanged: (value) {
            setState(() {
              _pin = value;
              _error = null;
            });
            if (value.length >= AppConstants.minPinLength) {
              // wait for explicit continue to allow variable PIN lengths
            }
          },
        ),
        if (_error != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
        const SizedBox(height: AppSpacing.lg),
        if (_isVerifying)
          const CircularProgressIndicator()
        else
          FilledButton(
            onPressed: _pin.length >= AppConstants.minPinLength ? () => _submitPin(_pin) : null,
            child: const Text('Unlock'),
          ),
        const SizedBox(height: AppSpacing.md),
        if (authState.biometricEnabled)
          TextButton.icon(
            onPressed: _maybeTryBiometric,
            icon: const Icon(Icons.fingerprint),
            label: const Text('Use biometrics'),
          ),
        if (authState.hasPassword)
          TextButton(
            onPressed: () => setState(() {
              _usePassword = true;
              _error = null;
            }),
            child: const Text('Use password instead'),
          ),
      ],
    );
  }

  Widget _buildPasswordEntry() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          onSubmitted: (_) => _submitPassword(),
          decoration: const InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        if (_error != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
        const SizedBox(height: AppSpacing.lg),
        if (_isVerifying)
          const CircularProgressIndicator()
        else
          FilledButton(onPressed: _submitPassword, child: const Text('Unlock')),
        const SizedBox(height: AppSpacing.md),
        TextButton(
          onPressed: () => setState(() {
            _usePassword = false;
            _error = null;
          }),
          child: const Text('Use PIN instead'),
        ),
      ],
    );
  }
}
