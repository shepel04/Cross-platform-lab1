import 'package:flutter_test/flutter_test.dart';
import 'package:lab1/main.dart';

void main() {
  testWidgets('Navigation between pages', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Back'), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Next'), findsOneWidget);
  });
}
