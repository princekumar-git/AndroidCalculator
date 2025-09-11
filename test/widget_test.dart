// This is a basic Flutter widget test that verifies the division functionality.

import 'package:flutter_test/flutter_test.dart';
import 'package:my_calculator/main.dart';

void main() {
  testWidgets('Calculator performs division correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CalculatorApp());

    // Verify that the initial output is '0'.
    expect(find.text('0'), findsOneWidget);

    // Tap buttons to input '10'
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('0'));
    await tester.pump();

    // Tap the division button
    await tester.tap(find.text('/'));
    await tester.pump();

    // Tap buttons to input '2'
    await tester.tap(find.text('2'));
    await tester.pump();

    // Tap the equals button to perform the calculation
    await tester.tap(find.text('='));
    await tester.pumpAndSettle(); // Wait for any animations or updates to settle

    // Verify that the correct result '5.00' is displayed.
    expect(find.text('5.00'), findsOneWidget);
  });

  testWidgets('Calculator handles division by zero', (WidgetTester tester) async {
    // Build our app.
    await tester.pumpWidget(const CalculatorApp());

    // Tap buttons to input '10'
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('0'));
    await tester.pump();

    // Tap the division button
    await tester.tap(find.text('/'));
    await tester.pump();

    // Tap '0'
    await tester.tap(find.text('0'));
    await tester.pump();

    // Tap the equals button
    await tester.tap(find.text('='));
    await tester.pumpAndSettle();

    // Verify that the error message is displayed.
    expect(find.text('Error: Div by zero'), findsOneWidget);
  });
}