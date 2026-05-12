import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:accidentdetection/main.dart';

void main() {
  group('MonitorScreen', () {
    testWidgets('renders ACTIVE status by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      expect(find.text('SYSTEM ACTIVE'), findsOneWidget);
      expect(find.text('ACTIVE'), findsWidgets);
    });

    testWidgets('toggles to DISARMED when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      // Tap the big pulsing button
      await tester.tap(find.text('ACTIVE'));
      await tester.pumpAndSettle();

      expect(find.text('SYSTEM DISARMED'), findsOneWidget);
      expect(find.text('DISARMED'), findsOneWidget);
      expect(find.text('TAP TO ACTIVATE'), findsOneWidget);
    });

    testWidgets('shows system status rows', (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      expect(find.text('DetectionService'), findsOneWidget);
      expect(find.text('GPS Location'), findsOneWidget);
      expect(find.text('Accelerometer'), findsOneWidget);
      expect(find.text('Network Sync'), findsOneWidget);
    });
  });

  group('HistoryScreen', () {
    testWidgets('renders history stats and event list',
        (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      // Switch to History tab
      await tester.tap(find.text('HISTORY'));
      await tester.pumpAndSettle();

      expect(find.text('History'), findsOneWidget);
      expect(find.text('124'), findsOneWidget); // events count
      expect(find.text('08'), findsOneWidget); // impacts count
      expect(find.text('ACTIVE'), findsWidgets); // status card
    });

    testWidgets('shows recent event entries', (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('HISTORY'));
      await tester.pumpAndSettle();

      expect(find.text('IMPACT'), findsOneWidget);
      expect(find.text('SUDDEN STOP'), findsOneWidget);
      expect(find.text('SIGNAL LOSS'), findsOneWidget);
    });

    testWidgets('shows LOCATE buttons for each event',
        (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('HISTORY'));
      await tester.pumpAndSettle();

      expect(find.text('LOCATE'), findsNWidgets(3));
    });

    testWidgets('shows end of activity footer', (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('HISTORY'));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text('END OF RECENT ACTIVITY'),
        200,
      );
      expect(find.text('END OF RECENT ACTIVITY'), findsOneWidget);
    });
  });

  group('Bottom Navigation', () {
    testWidgets('starts on MONITOR tab', (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      expect(find.text('SAFETY MONITOR'), findsOneWidget);
    });

    testWidgets('navigates between MONITOR and HISTORY',
        (WidgetTester tester) async {
      await tester.pumpWidget(const AccidentDetectionApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('HISTORY'));
      await tester.pumpAndSettle();
      expect(find.text('History'), findsOneWidget);

      await tester.tap(find.text('MONITOR'));
      await tester.pumpAndSettle();
      expect(find.text('SAFETY MONITOR'), findsOneWidget);
    });
  });
}
