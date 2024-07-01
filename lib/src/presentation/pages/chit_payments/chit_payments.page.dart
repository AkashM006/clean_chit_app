import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payments_repository.impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payment/chit_payment_list.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChitPaymentsPage extends ConsumerWidget {
  const ChitPaymentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onChitPaymentCreate() {
      context.push(PAGES.chitpaymentcreate.path);
    }

    final chitPayments = ref.watch(chitPaymentsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "Chit Payments"),
      drawer: const AppDrawer(currentPage: PAGES.chitpayments),
      floatingActionButton: FloatingActionButton(
        onPressed: onChitPaymentCreate,
        child: const Icon(Icons.add),
      ),
      body: chitPayments.when(
        data: (data) => ChitPaymentList(chitPayments: data),
        error: (error, stackTrace) => CustomErrorWidget(error.toString()),
        loading: () => const CustomLoaderWidget(
          text: "Loading your chit Payments",
        ),
      ),
    );
  }
}
