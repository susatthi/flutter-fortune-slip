import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../assets/assets.gen.dart';
import '../state/omikuji.dart';
import '../use_case/draw_omikuji.dart';
import 'component/riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      omikujiNotifierProvider,
      (_, omikuji) async {
        final result = omikuji.result;
        if (result == null) {
          return;
        }

        await showDialog<void>(
          context: context,
          builder: (context) => _OmikujiResultDialog(result: result),
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
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.title.image(fit: BoxFit.cover),
            const Gap(32),
            const _DrawOmikujiButton(),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

class _DrawOmikujiButton extends ConsumerStatefulWidget {
  const _DrawOmikujiButton();

  static const _size = 200.0;

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
        error: (err, _) async {
          _stopShake();
          await showDialog<void>(
            context: context,
            builder: (context) => ErrorDialog(error: err),
          );
        },
        // ローディング中は揺らす
        loading: _startShake,
      ),
      onError: (err, _) async {
        _stopShake();
        await showDialog<void>(
          context: context,
          builder: (context) => ErrorDialog(error: err),
        );
      },
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
    required this.result,
  });

  final OmikujiResult result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: result.assetImage.image(),
    );
  }
}

extension on OmikujiResult {
  AssetGenImage get assetImage => switch (this) {
        OmikujiResult.daikichi => Assets.images.omikujiDaikichi,
        OmikujiResult.kichi => Assets.images.omikujiKichi,
        OmikujiResult.chuukichi => Assets.images.omikujiChuukichi,
        OmikujiResult.syoukichi => Assets.images.omikujiSyoukichi,
        OmikujiResult.suekichi => Assets.images.omikujiSuekichi,
        OmikujiResult.kyou => Assets.images.omikujiKyou,
        OmikujiResult.daikyou => Assets.images.omikujiDaikyou,
      };
}
