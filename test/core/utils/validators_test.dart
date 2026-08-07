import 'package:debt_ledger/core/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators.fullName', () {
    test('rejects empty name', () {
      expect(Validators.fullName(''), isNotNull);
      expect(Validators.fullName('   '), isNotNull);
      expect(Validators.fullName(null), isNotNull);
    });

    test('accepts a normal name', () {
      expect(Validators.fullName('Jane Doe'), isNull);
    });

    test('rejects overly long name', () {
      expect(Validators.fullName('a' * 121), isNotNull);
    });
  });

  group('Validators.mobile', () {
    test('optional field allows empty', () {
      expect(Validators.mobile(''), isNull);
      expect(Validators.mobile(null), isNull);
    });

    test('accepts valid formatted numbers', () {
      expect(Validators.mobile('+1 (555) 123-4567'), isNull);
      expect(Validators.mobile('09171234567'), isNull);
    });

    test('rejects too-short numbers', () {
      expect(Validators.mobile('123'), isNotNull);
    });
  });

  group('Validators.amount', () {
    test('rejects empty, non-numeric, zero, and negative', () {
      expect(Validators.amount(''), isNotNull);
      expect(Validators.amount('abc'), isNotNull);
      expect(Validators.amount('0'), isNotNull);
      expect(Validators.amount('-5'), isNotNull);
    });

    test('accepts a positive number', () {
      expect(Validators.amount('100.50'), isNull);
    });
  });

  group('Validators.requiredReason', () {
    test('rejects empty reason', () {
      expect(Validators.requiredReason(''), isNotNull);
      expect(Validators.requiredReason(null), isNotNull);
    });

    test('accepts a provided reason', () {
      expect(Validators.requiredReason('Paid in cash'), isNull);
    });
  });

  group('Validators.pin', () {
    test('rejects PIN outside 4-6 digits', () {
      expect(Validators.pin('123'), isNotNull);
      expect(Validators.pin('1234567'), isNotNull);
    });

    test('rejects non-numeric PIN', () {
      expect(Validators.pin('12ab'), isNotNull);
    });

    test('accepts a valid PIN', () {
      expect(Validators.pin('1234'), isNull);
      expect(Validators.pin('123456'), isNull);
    });
  });

  group('Validators.password', () {
    test('rejects short password', () {
      expect(Validators.password('abc12'), isNotNull);
    });

    test('accepts a 6+ character password', () {
      expect(Validators.password('abc123'), isNull);
    });
  });
}
