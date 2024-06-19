import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDetailPage extends ConsumerWidget {
  const ChitDetailPage({
    super.key,
    required this.chitId,
  });

  final int chitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chit = ref.watch(chitProvider(chitId));

    return Scaffold(
      body: Center(
        child: chit.when(
          data: (data) => Text("Chit Payments : ${data.chitPayments.length}"),
          error: (error, stackTrace) => const Text("Error"),
          loading: () => const Text("Loading"),
        ),
      ),
    );
  }
}
