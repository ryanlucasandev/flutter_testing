import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'counter_bloc.dart';

void main() {
  group(CounterBloc, () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, equals(0));
    });

    blocTest(
      'emits [1] when CounterIncrementPressed is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [1],
    );

    blocTest(
      'emits [1] when CounterDecrementPressed is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [-1],
    );
  });
}
