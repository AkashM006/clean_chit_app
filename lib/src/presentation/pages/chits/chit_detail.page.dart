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
    return Scaffold(
      body: Center(
        child: Text("Chit Detail ID: ${chitId.toString()}"),
      ),
    );
  }
}
