import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shadows_on_the_quarry_wall/main.dart';

void main() {
  testWidgets('shows quarry onboarding on first launch', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(ProviderScope(child: MyApp(preferences: prefs)));
    await tester.pumpAndSettle();

    expect(find.text('Drawing Office.'), findsOneWidget);
    expect(find.textContaining('Shadows on'), findsOneWidget);
  });
}
