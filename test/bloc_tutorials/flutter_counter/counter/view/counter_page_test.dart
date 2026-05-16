import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/bloc_tutorials/flutter_counter/counter/counter.dart';

void main() {
  group(CounterPage, () {
    testWidgets('renders $CounterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
