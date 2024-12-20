import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../state/omikuji.dart';
import '../use_case/draw_omikuji.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _launchConfetti(BuildContext context) {
    double randomInRange(double min, double max) {
      return min + math.Random().nextDouble() * (max - min);
    }

    const total = 30;
    var progress = 0;

    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      progress++;

      if (progress >= total) {
        timer.cancel();
        return;
      }

      final count = ((1 - progress / total) * 100).toInt();

      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: count,
          startVelocity: 30,
          spread: 360,
          ticks: 60,
          x: randomInRange(0.1, 0.3),
          y: math.Random().nextDouble() - 0.2,
        ),
      );
      Confetti.launch(
        context,
        options: ConfettiOptions(
          particleCount: count,
          startVelocity: 30,
          spread: 360,
          ticks: 60,
          x: randomInRange(0.7, 0.9),
          y: math.Random().nextDouble() - 0.2,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      omikujiNotifierProvider,
      (_, omikuji) async {
        // おみくじが引かれていない場合は何もしない
        if (omikuji == null) {
          return;
        }

        // 大吉の場合はコンフェティを表示
        if (omikuji == Omikuji.daikichi) {
          _launchConfetti(context);
        }

        // おみくじの結果を表示
        await showDialog<void>(
          context: context,
          builder: (context) => _OmikujiResultDialog(omikuji: omikuji),
        );
      },
    );

    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _DrawOmikujiButton(),
        ),
        Align(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('※タップするとおみくじが引けます'),
          ),
        ),
      ],
    );
  }
}

class _DrawOmikujiButton extends ConsumerStatefulWidget {
  const _DrawOmikujiButton();

  static const _size = 300.0;

  @override
  ConsumerState<_DrawOmikujiButton> createState() => _DrawOmikujiButtonState();
}

class _DrawOmikujiButtonState extends ConsumerState<_DrawOmikujiButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 小刻みに揺らすアニメーション
    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(); // 戻る動きを追加
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startShake() async {
    await _controller.repeat(reverse: true);
  }

  void _stopShake() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      drawOmikujiUseCaseProvider,
      (_, next) => next.when(
        // おみくじの結果が出たら止める
        data: (data) => _stopShake(),
        error: (err, _) {
          _stopShake();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(err.toString())),
          );
        },
        // ローディング中は揺らす
        loading: _startShake,
      ),
    );

    final isLoading = ref.watch(drawOmikujiUseCaseProvider).isLoading;
    return GestureDetector(
      onTap: isLoading
          ? null
          : () => ref.read(drawOmikujiUseCaseProvider.notifier).invoke(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: child,
          );
        },
        child: Assets.images.syougatsu2Omijikuji2.image(
          width: _DrawOmikujiButton._size,
          height: _DrawOmikujiButton._size,
        ),
      ),
    );
  }
}

class _OmikujiResultDialog extends StatelessWidget {
  const _OmikujiResultDialog({
    required this.omikuji,
  });

  final Omikuji omikuji;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: omikuji.assetImage.image(
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

extension on Omikuji {
  AssetGenImage get assetImage => switch (this) {
        Omikuji.daikichi => Assets.images.omikujiDaikichi,
        Omikuji.kichi => Assets.images.omikujiKichi,
        Omikuji.chuukichi => Assets.images.omikujiChuukichi,
        Omikuji.syoukichi => Assets.images.omikujiSyoukichi,
        Omikuji.suekichi => Assets.images.omikujiSuekichi,
        Omikuji.kyou => Assets.images.omikujiKyou,
        Omikuji.daikyou => Assets.images.omikujiDaikyou,
      };
}
