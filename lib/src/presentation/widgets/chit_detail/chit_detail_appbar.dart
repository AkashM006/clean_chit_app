import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDetailAppbar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final int chitId;
  const ChitDetailAppbar({
    super.key,
    required this.chitId,
  });

  @override
  ConsumerState<ChitDetailAppbar> createState() => _ChitDetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChitDetailAppBarState extends ConsumerState<ChitDetailAppbar> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void onDelete() async {
      final shouldDelete = await showDialog<bool?>(
        context: context,
        builder: (context) => const ChitDeleteDialog(),
      );

      if (shouldDelete != null && shouldDelete) {
        ref.read(chitControllerProvider.notifier).deleteChit(widget.chitId);
      }
    }

    ref.listen(
      chitControllerProvider,
      (previous, next) {
        if (next.deleteChit.isLoading) {
          setState(() {
            isLoading = true;
          });
          return;
        }

        setState(() {
          isLoading = false;
        });

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

    return AppBar(
      actions: [
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
