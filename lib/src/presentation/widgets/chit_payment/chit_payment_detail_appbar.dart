import 'package:chit_app_clean/src/presentation/widgets/common/app_bar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPaymentDetailAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const ChitPaymentDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() {}

    void onEdit() {}

    // final isLoading = ref.watch(chitPaymentsControllerProvider).

    return AppBar(
      actions: [
        IconButton(onPressed: onEdit, icon: const EditAppbarIcon()),
        IconButton(onPressed: onDelete, icon: const DeleteAppBarIcon()),
      ],
    );
  }
}
