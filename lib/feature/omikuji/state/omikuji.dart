import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'omikuji.freezed.dart';
part 'omikuji.g.dart';

@freezed
class Omikuji with _$Omikuji {
  const factory Omikuji({
    OmikujiResult? result,
  }) = _Omikuji;
}

enum OmikujiResult {
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
  Omikuji build() => const Omikuji();

  Future<void> draw() async {
    // 3秒間遅延
    await Future<void>.delayed(const Duration(seconds: 3));

    // 1/5の確率でエラーになる
    if (math.Random().nextInt(5) == 0) {
      throw Exception('おみくじが出てきませんでした。もう一度引いてください。');
    }

    // ランダムでおみくじを引く
    state = Omikuji(
      result: OmikujiResult
          .values[math.Random().nextInt(OmikujiResult.values.length)],
    );
  }
}
