import '../constants/app_constants.dart';

/// Pure validation functions shared by form field validators (UI) and
/// use-case guard clauses (domain), so validation rules live in exactly
/// one place.
class Validators {
  const Validators._();

  static String? fullName(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'Full name is required';
    if (trimmed.length > 120) return 'Full name is too long';
    return null;
  }

  static String? optionalText(String? value, {int maxLength = 500, String label = 'Field'}) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.length > maxLength) return '$label is too long';
    return null;
  }

  static String? mobile(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return null;
    final digitsOnly = trimmed.replaceAll(RegExp(r'[\s\-()+]'), '');
    if (!RegExp(r'^\d{6,15}$').hasMatch(digitsOnly)) {
      return 'Enter a valid mobile number';
    }
    return null;
  }

  static String? amount(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'Amount is required';
    final parsed = double.tryParse(trimmed);
    if (parsed == null) return 'Enter a valid number';
    if (parsed <= 0) return 'Amount must be greater than zero';
    return null;
  }

  static String? requiredReason(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'A reason is required';
    if (trimmed.length > 500) return 'Reason is too long';
    return null;
  }

  static String? pin(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.length < AppConstants.minPinLength || trimmed.length > AppConstants.maxPinLength) {
      return 'PIN must be ${AppConstants.minPinLength}-${AppConstants.maxPinLength} digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(trimmed)) return 'PIN must contain only digits';
    return null;
  }

  static String? password(String? value) {
    final trimmed = value ?? '';
    if (trimmed.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
