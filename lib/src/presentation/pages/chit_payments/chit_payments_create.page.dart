import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payments_repository.impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_payments/chit_payments_form.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentsCreatePage extends ConsumerWidget {
  const ChitPaymentsCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitNamesAndIds = ref.watch(chitNamesAndIdsProvider);

    return Scaffold(
        appBar: const CustomAppBar(title: "Add Chit Payment"),
        body: switch (chitNamesAndIds) {
          AsyncData(value: final chits) => chits.isEmpty
              ? const Center(
                  child: Text(
                    "You have no chits. Add one to create a Chit Payment",
                  ),
                )
              : ChitPaymentsForm(
                  chitNamesAndIds: chits,
                ),
          AsyncError(error: final error) => CustomErrorWidget(error.toString()),
          _ => const CustomLoaderWidget(text: "Loading your Payments"),
        });
  }
}
