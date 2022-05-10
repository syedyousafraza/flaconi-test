import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('verify album searching', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

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
    // await tester.pumpAndSettle();

    // FAVORITE BUTTON

    //  bool matchRoot;
    final bool firstMatchOnly;
    var favIcon = find.descendant(
      of: find.byType(Align),
      matching: find.byType(FavoriteButton),
      matchRoot: true,
    );

    expect(find.byType(FavoriteButton), findsWidgets);

    //  await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.tap(favIcon);
    await tester.pumpAndSettle();

    //  expect(favIcon.isFavorite.value, true);

    final backBtn = find.byTooltip("Back");
    await tester.tap(backBtn);
    await tester.pumpAndSettle();
    await tester.tap(backBtn);
    await tester.pumpAndSettle();

//    expect(find.text("British Steel"), findsOneWidget);
  });
}
