import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payment_repository.impl.dart';
import 'package:chit_app_clean/src/domain/models/chit_payment.model.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payment/chit_payment_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentCreatePage extends ConsumerWidget {
  final DateTime? paymentDate;
  final PaymentType? paymentType;
  final int? chitId;
  final int? paidAmount;
  final int? receivedAmount;
  final bool? isEdit;
  final ChitPaymentWithChitNameAndIdModel? chitPaymentWithChitNameAndIdModel;
  const ChitPaymentCreatePage({
    super.key,
    this.paymentDate,
    this.paymentType,
    this.chitId,
    this.paidAmount,
    this.receivedAmount,
    this.isEdit,
    this.chitPaymentWithChitNameAndIdModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitNamesAndIds = ref.watch(chitNamesAndIdsProvider);

    return Scaffold(
      appBar: isEdit != null && isEdit!
          ? CustomAppBar(
              title: chitNamesAndIds.when(
                data: (data) => "Edit Chit",
                error: (error, stackTrace) => "Error",
                loading: () => "Loading",
              ),
            )
          : const CustomAppBar(title: "Add Chit Payment"),
      body: chitNamesAndIds.when(
        data: (data) => data.isEmpty
            ? const Center(
                child: Text(
                  "You have no chits. Add one to create a Chit Payment",
                ),
              )
            : ChitPaymentsForm(
                chitNamesAndIds: data,
                chitId: chitId,
                paidAmount: paidAmount,
                receivedAmount: receivedAmount,
                isFormEdit: isEdit ?? false,
                paymentDate: paymentDate,
                paymentType: paymentType,
                chitPaymentWithChitNameAndIdModel:
                    chitPaymentWithChitNameAndIdModel,
              ),
        error: (error, stackTrace) => CustomErrorWidget(error.toString()),
        loading: () => const CustomLoaderWidget(text: "Loading your Payments"),
      ),
    );
  }
}
