import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDetailAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final int chitId;
  const ChitDetailAppbar({
    super.key,
    required this.chitId,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() async {
      final shouldDelete = await showDialog<bool?>(
        context: context,
        builder: (context) => const ChitDeleteDialog(),
      );

      if (shouldDelete != null && shouldDelete) {
        ref.read(chitControllerProvider.notifier).deleteChit(chitId);
      }
    }

    void onEdit() {}

    ref.listen(
      chitControllerProvider,
      (previous, next) {
        if (next.deleteChit.isLoading) return;

        final message = next.deleteChit.isFailure
            ? next.deleteChit.message
            : "Deleted your chit successfully";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );

        if (next.deleteChit.isSuccess) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              Navigator.of(context).pop();
            },
          );
        }
      },
    );

    final isLoading = ref.read(chitControllerProvider).deleteChit.isLoading;

    return AppBar(
      actions: [
        IconButton(
          onPressed: onEdit,
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: isLoading ? null : onDelete,
          icon: Icon(
            Icons.delete_forever_outlined,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
  }
}
