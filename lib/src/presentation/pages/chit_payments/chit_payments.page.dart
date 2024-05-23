import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChitPaymentsPage extends ConsumerWidget {
  const ChitPaymentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todo: Create a stream that returns List<ChitPaymentsModel> and listen to it here

    void onChitPaymentCreate() {
      context.push(PAGES.chitpaymentscreate.path);
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Chit Payments"),
      drawer: const AppDrawer(currentPage: PAGES.chitpayments),
      floatingActionButton: FloatingActionButton(
        onPressed: onChitPaymentCreate,
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text("Chit Payments"),
      ),
    );
  }
}
