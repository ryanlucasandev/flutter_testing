import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/widget_test/scrolling_widget.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('finds a deep item in a long list', (tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(
      MyApp(items: List<String>.generate(10000, (i) => 'Item $i')),
    );

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // Scroll until the itme to be found appears
    await binding.traceAction(() async {
      // Scroll until the item to be found appears.
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );
    }, reportKey: 'scrolling_timeline');
  });
}
