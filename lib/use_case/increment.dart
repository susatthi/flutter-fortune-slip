import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/counter.dart';
import 'use_case.dart';

part 'increment.g.dart';

@riverpod
class IncrementUseCase extends _$IncrementUseCase with UseCase {
  @override
  FutureOr<void> build() => buildInternal();

  Future<void> invoke() => invokeInternal(() async {
        await ref.read(counterNotifierProvider.notifier).increment();
      });
}
