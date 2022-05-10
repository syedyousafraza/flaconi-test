import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify end to end for application',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text("No Albums added yet"), findsOneWidget);
      expect(find.text("Music App"), findsOneWidget);
      // findig the widget
      var textFind = find.text("No Albums added yet");
      expect(textFind, findsOneWidget);
      //final Finder fab = find.byTooltip('Increment');
      final Finder searchIcon = find.byIcon(Icons.search);
      expect(searchIcon, findsOneWidget);
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Test');
      await tester.pumpAndSettle();
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();

      var searchItems = find.text("Testament");
      expect(searchItems, findsOneWidget);

      await tester.tap(searchItems);
      await tester.pumpAndSettle();
      expect(find.text("British Steel"), findsOneWidget);
      expect(find.text("Testament Top Albums"), findsOneWidget);
      await tester.pumpAndSettle();

/*
    testWidgets('Favourite test', (WidgetTester tester) async {
      app.main();

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        Color c = const Color(4291076954);
        expect(find.byKey(ValueKey(c)), findsOneWidget);
      }
*/
      await tester.tap(find.text("British Steel"));
      await tester.pumpAndSettle();
      expect(find.text("Album"), findsOneWidget);
      expect(find.text("British Steel"), findsOneWidget);
      expect(find.text("Music App"), findsOneWidget);

      final backBtn = find.byTooltip("Back");
      await tester.pumpAndSettle();

      await tester.tap(backBtn);
      await tester.pumpAndSettle();

/*
      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
*/
    });
  });
}
