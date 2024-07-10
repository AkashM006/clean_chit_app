import 'package:chit_app_clean/src/presentation/controllers/chit_payment/chit_payment.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/app_bar_icons.dart';
import 'package:chit_app_clean/src/utils/functions/action_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    void onDelete() async {
      await ref
          .read(chitPaymentControllerProvider.notifier)
          .deleteChitPayment(chitPaymentId);

      if (context.mounted) {
        final controllerState =
            ref.read(chitPaymentControllerProvider).deleteChitPayment;
        actionHandler(
          controllerState,
          context,
          successCallback: () {
            context.pop();
          },
        );
      }
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
