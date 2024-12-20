import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/omikuji.dart';
import 'use_case.dart';

part 'draw_omikuji.g.dart';

@riverpod
class DrawOmikujiUseCase extends _$DrawOmikujiUseCase with UseCase {
  @override
  FutureOr<void> build() => buildInternal();

  Future<void> invoke() => invokeInternal(() async {
        await ref.read(omikujiNotifierProvider.notifier).draw();
      });
}
