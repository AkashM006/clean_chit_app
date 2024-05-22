import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ChitPaymentsPage extends ConsumerWidget {
  const ChitPaymentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Chit Payments"),
      body: Center(
        child: Text("Chit Payments"),
      ),
    );
  }
}
