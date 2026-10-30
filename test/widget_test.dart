import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wss_workshop_manager/main.dart';
import 'package:wss_workshop_manager/widgets/counter_stepper.dart';

void main() {
  testWidgets('Workshop Equipment Manager loads successfully',
          (WidgetTester tester) async {
        await tester.pumpWidget(const WorkshopManagerApp());

        expect(find.text('Workshop Equipment'), findsOneWidget);
        expect(find.text('Equipment Catalog'), findsOneWidget);
      });

  testWidgets('Rental duration counter increases when plus is pressed',
          (WidgetTester tester) async {
        int rentalHours = 1;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return CounterStepper(
                    value: rentalHours,
                    onChanged: (newValue) {
                      setState(() {
                        rentalHours = newValue;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text('1'), findsOneWidget);

        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        expect(rentalHours, 2);
        expect(find.text('2'), findsOneWidget);
      });

  testWidgets('Rental duration cannot go below minimum',
          (WidgetTester tester) async {
        int rentalHours = 1;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return CounterStepper(
                    value: rentalHours,
                    onChanged: (newValue) {
                      setState(() {
                        rentalHours = newValue;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text('1'), findsOneWidget);

        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        expect(rentalHours, 1);
        expect(find.text('1'), findsOneWidget);
      });
}
