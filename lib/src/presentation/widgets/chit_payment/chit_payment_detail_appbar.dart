import 'package:chit_app_clean/src/presentation/controllers/chit_payment/chit_payment.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/app_bar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentDetailAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  final int chitPaymentId;
  const ChitPaymentDetailAppBar({
    super.key,
    required this.chitPaymentId,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() {
      ref
          .read(chitPaymentControllerProvider.notifier)
          .deleteChitPayment(chitPaymentId);
    }

    void onEdit() {}

    final isLoading =
        ref.watch(chitPaymentControllerProvider).deleteChitPayment.isLoading;

    return AppBar(
      actions: [
        IconButton(
          onPressed: isLoading ? null : onEdit,
          icon: const EditAppbarIcon(),
        ),
        IconButton(
          onPressed: isLoading ? null : onDelete,
          icon: const DeleteAppBarIcon(),
        ),
      ],
    );
  }
}
