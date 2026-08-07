enum AuthStatus { needsSetup, locked, unlocked }

class AuthState {
  const AuthState({
    required this.status,
    this.biometricEnabled = false,
    this.hasPassword = false,
    this.lockoutRemaining,
  });

  final AuthStatus status;
  final bool biometricEnabled;
  final bool hasPassword;
  final Duration? lockoutRemaining;

  bool get isLockedOut => lockoutRemaining != null && lockoutRemaining! > Duration.zero;

  AuthState copyWith({
    AuthStatus? status,
    bool? biometricEnabled,
    bool? hasPassword,
    Duration? lockoutRemaining,
  }) {
    return AuthState(
      status: status ?? this.status,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      hasPassword: hasPassword ?? this.hasPassword,
      lockoutRemaining: lockoutRemaining,
    );
  }
}
