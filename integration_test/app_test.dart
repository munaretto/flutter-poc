import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poc/main.dart';

void main() {
  group('Testing App Performance', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test if scrolling is working', (tester) async {
      await tester.pumpWidget(TestingApp());

      final listFinder = find.byType(ListView);

      await binding.watchPerformance(() async {
        await tester.fling(listFinder, Offset(0, -500), 10000);
        await tester.pumpAndSettle();

        await tester.fling(listFinder, Offset(0, 500), 10000);
        await tester.pumpAndSettle();
      }, reportKey: 'scrolling_summary');
    });

    testWidgets('Test if operations on favorite items is working', (tester) async {
      await tester.pumpWidget(TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon))); // top on icon
        await tester.pumpAndSettle(Duration(seconds: 1)); // waits until animation is complete
        expect(find.text('Added to favorites.'), findsOneWidget); // expect snackbar to appear with given text (added item)
      }

      await tester.tap(find.text('Favorites')); // tap on the favorites "button"
      await tester.pumpAndSettle(); // waits until animation is complete

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey))); // tap on icon
        await tester.pumpAndSettle(Duration(seconds: 1)); // waits until animation is complete
        expect(find.text('Removed from favorites.'), findsOneWidget); // expect snackbar to appear with given text (removed item)
      }
    });
  });
}
