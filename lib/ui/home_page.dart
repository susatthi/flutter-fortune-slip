import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../state/counter.dart';
import '../use_case/increment_use_case.dart';
import 'component/riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Button'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CountText(),
          Gap(16),
          _InteractiveButton(),
        ],
      ),
    );
  }
}

class _InteractiveButton extends ConsumerWidget {
  const _InteractiveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(incrementUseCaseProvider);
    final isLoading = ref.watch(incrementUseCaseProvider).isLoading;
    return SizedBox(
      width: 200,
      child: FilledButton(
        onPressed: isLoading
            ? null
            : () => ref.read(incrementUseCaseProvider.notifier).invoke(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) ...[
              const _LoadingIndicator(),
              const Gap(8),
            ],
            const Text('Increment'),
          ],
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class _CountText extends ConsumerWidget {
  const _CountText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Text(
      counter.value.toString(),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
