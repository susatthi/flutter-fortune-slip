import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/omikuji.dart';

part 'draw_omikuji.g.dart';

@riverpod
class DrawOmikujiUseCase extends _$DrawOmikujiUseCase {
  @override
  FutureOr<void> build() => null;

  Future<void> invoke() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(omikujiNotifierProvider.notifier).draw();
    });
  }
}
