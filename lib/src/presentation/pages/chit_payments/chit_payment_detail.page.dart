import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payments_repository.impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payment/chit_payment_detail_appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payment_detail/chit_payment_detail_body.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentDetailPage extends ConsumerWidget {
  final int chitPaymentId;
  const ChitPaymentDetailPage({
    super.key,
    required this.chitPaymentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitPayment = ref.watch(chitPaymentProvider(chitPaymentId));

    return SafeArea(
      child: Scaffold(
        appBar: chitPayment.when(
          data: (data) => ChitPaymentDetailAppBar(chitPaymentId: chitPaymentId),
          error: (error, stackTrace) => AppBar(
            title: const Text("Error"),
          ),
          loading: () => AppBar(
            title: const Text("Loading..."),
          ),
        ),
        body: chitPayment.when(
          data: (data) => ChitPaymentDetailBody(
            chitPaymentWithChitAndIdModel: data,
          ),
          error: (error, stackTrace) => CustomErrorWidget(error.toString()),
          loading: () => const CustomLoaderWidget(),
        ),
      ),
    );
  }
}
