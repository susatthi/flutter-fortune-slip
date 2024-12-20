import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefX on WidgetRef {
  /// listen()のAsyncValue版
  void listenAsync<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    void Function(T data)? success,
    void Function()? loading,
  }) =>
      listen<AsyncValue<T>>(
        provider,
        (_, next) => next.when(
          data: (data) => success?.call(data),
          error: (err, _) => showDialog<void>(
            context: context,
            builder: (context) => ErrorDialog(error: err),
          ),
          loading: () => loading?.call(),
        ),
        onError: (err, _) => showDialog<void>(
          context: context,
          builder: (context) => ErrorDialog(error: err),
        ),
      );
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラー'),
      content: Text(error.toString()),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
