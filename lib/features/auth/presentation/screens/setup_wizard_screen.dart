import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../providers/auth_providers.dart';
import '../widgets/pin_pad.dart';

enum _SetupStep { createPin, confirmPin, password, biometric }

class SetupWizardScreen extends ConsumerStatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  ConsumerState<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends ConsumerState<SetupWizardScreen> {
  _SetupStep _step = _SetupStep.createPin;
  String _firstPin = '';
  String _currentPin = '';
  String? _error;
  bool _biometricAvailable = false;
  bool _isSubmitting = false;

  final _passwordController = TextEditingController();
  final _pinPadKey = GlobalKey<PinPadState>();

  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

  Future<void> _checkBiometricAvailability() async {
    final repo = ref.read(authRepositoryProvider);
    final supported = await repo.isBiometricDeviceSupported();
    if (mounted) setState(() => _biometricAvailable = supported);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onPinChanged(String value) {
    setState(() {
      _currentPin = value;
      _error = null;
    });
    if (value.length >= AppConstants.minPinLength) {
      // allow continue button, don't auto-advance since PIN length is variable
    }
  }

  void _onCreatePinContinue() {
    if (_currentPin.length < AppConstants.minPinLength) {
      setState(() => _error = 'PIN must be at least ${AppConstants.minPinLength} digits');
      return;
    }
    setState(() {
      _firstPin = _currentPin;
      _currentPin = '';
      _error = null;
      _step = _SetupStep.confirmPin;
    });
    _pinPadKey.currentState?.clear();
  }

  void _onConfirmPinContinue() {
    if (_currentPin != _firstPin) {
      setState(() {
        _error = 'PINs do not match. Try again.';
        _currentPin = '';
        _firstPin = '';
        _step = _SetupStep.createPin;
      });
      _pinPadKey.currentState?.clear();
      return;
    }
    setState(() {
      _step = _SetupStep.password;
      _error = null;
    });
  }

  void _skipPassword() {
    setState(() => _step = _SetupStep.biometric);
  }

  void _continueFromPassword() {
    setState(() => _step = _SetupStep.biometric);
  }

  Future<void> _finishSetup({required bool enableBiometric}) async {
    setState(() => _isSubmitting = true);
    final success = await ref.read(authControllerProvider.notifier).completeSetup(
          pin: _firstPin,
          password: _passwordController.text.isEmpty ? null : _passwordController.text,
          enableBiometric: enableBiometric,
        );
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    if (!success) {
      setState(() => _error = 'Could not complete setup. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppScaffold(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.xl),
                Icon(Icons.shield_outlined, size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: AppSpacing.md),
                Text('Secure Debt Ledger', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _subtitleForStep(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xxl),
                Expanded(child: _buildStepBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _subtitleForStep() {
    switch (_step) {
      case _SetupStep.createPin:
        return 'Create a PIN to protect your ledger';
      case _SetupStep.confirmPin:
        return 'Re-enter your PIN to confirm';
      case _SetupStep.password:
        return 'Optionally set a backup password';
      case _SetupStep.biometric:
        return 'Optionally enable biometric unlock';
    }
  }

  Widget _buildStepBody() {
    switch (_step) {
      case _SetupStep.createPin:
      case _SetupStep.confirmPin:
        return _buildPinStep();
      case _SetupStep.password:
        return _buildPasswordStep();
      case _SetupStep.biometric:
        return _buildBiometricStep();
    }
  }

  Widget _buildPinStep() {
    final isConfirm = _step == _SetupStep.confirmPin;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PinPad(key: _pinPadKey, onChanged: _onPinChanged),
        if (_error != null) ...[
          const SizedBox(height: AppSpacing.md),
          Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
        const SizedBox(height: AppSpacing.xl),
        FilledButton(
          onPressed: _currentPin.length >= AppConstants.minPinLength
              ? (isConfirm ? _onConfirmPinContinue : _onCreatePinContinue)
              : null,
          child: const Text('Continue'),
        ),
      ],
    );
  }

  Widget _buildPasswordStep() {
    return Column(
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Backup password (optional)',
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        FilledButton(onPressed: _continueFromPassword, child: const Text('Continue')),
        const SizedBox(height: AppSpacing.sm),
        TextButton(onPressed: _skipPassword, child: const Text('Skip')),
      ],
    );
  }

  Widget _buildBiometricStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.fingerprint, size: 64, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: AppSpacing.lg),
        if (_error != null) ...[
          Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          const SizedBox(height: AppSpacing.md),
        ],
        if (_isSubmitting)
          const CircularProgressIndicator()
        else ...[
          if (_biometricAvailable)
            FilledButton.icon(
              onPressed: () => _finishSetup(enableBiometric: true),
              icon: const Icon(Icons.fingerprint),
              label: const Text('Enable biometric unlock'),
            ),
          const SizedBox(height: AppSpacing.sm),
          TextButton(
            onPressed: () => _finishSetup(enableBiometric: false),
            child: const Text('Skip'),
          ),
        ],
      ],
    );
  }
}
