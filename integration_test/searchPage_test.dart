import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('verify searching', (WidgetTester tester) async {
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

    //   var searchItems = find.text("Testament");
    //   expect(searchItems, findsOneWidget);
    //   await tester.pumpAndSettle();

    final gesture =
        await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -300)); //How much to scroll by
    await tester.pump();
  });
}
