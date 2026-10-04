import 'package:flutter_test/flutter_test.dart';
import 'package:brewcraft_app/main.dart';

void main() {
  testWidgets('BrewCraft app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BrewCraftApp());
    expect(find.text('BrewCraft'), findsOneWidget);
  });
}
