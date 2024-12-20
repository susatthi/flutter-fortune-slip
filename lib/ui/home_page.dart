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
            Assets.images.bg.image(fit: BoxFit.cover),
            const _DrawOmikujiButton(),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

class _DrawOmikujiButton extends ConsumerWidget {
  const _DrawOmikujiButton();

  static const _size = 200.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenAsync(drawOmikujiUseCaseProvider);
    final isLoading = ref.watch(drawOmikujiUseCaseProvider).isLoading;
    return GestureDetector(
      onTap: isLoading
          ? null
          : () => ref.read(drawOmikujiUseCaseProvider.notifier).invoke(),
      child: Assets.images.syougatsu2Omijikuji2.image(
        width: _size,
        height: _size,
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
