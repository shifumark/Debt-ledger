import 'package:debt_ledger/core/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyState renders title, message, and action', (tester) async {
    var actionPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmptyState(
            icon: Icons.people_outline,
            title: 'No debtors yet',
            message: 'Tap the + button to add your first debtor.',
            action: FilledButton(
              onPressed: () => actionPressed = true,
              child: const Text('Add Debtor'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('No debtors yet'), findsOneWidget);
    expect(find.text('Tap the + button to add your first debtor.'), findsOneWidget);
    expect(find.byIcon(Icons.people_outline), findsOneWidget);

    await tester.tap(find.text('Add Debtor'));
    await tester.pump();
    expect(actionPressed, isTrue);
  });
}
