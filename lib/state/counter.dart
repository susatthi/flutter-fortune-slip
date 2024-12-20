import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    @Default(0) int value,
  }) = _Counter;
}

@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  Counter build() => const Counter();

  Future<void> increment() async {
    // 擬似的に3秒間遅延
    await Future<void>.delayed(const Duration(seconds: 3));

    // たまにエラーを返す
    if (math.Random().nextBool()) {
      throw Exception('エラー');
    }
    state = Counter(value: state.value + 1);
  }
}
