import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'omikuji.g.dart';

enum Omikuji {
  daikichi,
  kichi,
  chuukichi,
  syoukichi,
  suekichi,
  kyou,
  daikyou,
  ;
}

@riverpod
class OmikujiNotifier extends _$OmikujiNotifier {
  @override
  Omikuji? build() => null;

  Future<void> draw() async {
    // 3秒間遅延
    await Future<void>.delayed(const Duration(seconds: 3));

    // 1/5の確率でエラーになる
    if (math.Random().nextInt(5) == 0) {
      throw Exception('おみくじが出てきませんでした。もう一度引いてください。');
    }

    // ランダムでおみくじを引く
    state = Omikuji.values[math.Random().nextInt(Omikuji.values.length)];
  }
}
