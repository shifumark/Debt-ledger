import 'package:intl/intl.dart';

class CurrencyFormatter {
  const CurrencyFormatter._();

  /// Formats [amount] using the given ISO 4217 [currencyCode] (default USD).
  /// A negative [amount] renders with a leading minus sign.
  static String format(double amount, {String currencyCode = 'USD'}) {
    final format = NumberFormat.simpleCurrency(name: currencyCode);
    return format.format(amount);
  }

  static String formatCompact(double amount, {String currencyCode = 'USD'}) {
    final format = NumberFormat.compactSimpleCurrency(name: currencyCode);
    return format.format(amount);
  }
}
