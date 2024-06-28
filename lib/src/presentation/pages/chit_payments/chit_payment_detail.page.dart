import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payments_repository.impl.dart';
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
        body: chitPayment.when(
          data: (data) => Text(data.chit.name),
          error: (error, stackTrace) => CustomErrorWidget(error.toString()),
          loading: () => const CustomLoaderWidget(),
        ),
      ),
    );
  }
}
