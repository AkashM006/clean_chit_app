import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chits/chit.controller.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_delete_dialog.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/app_bar_icons.dart';
import 'package:chit_app_clean/src/utils/functions/action_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitDetailAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final int chitId;
  final ChitModel chit;
  final List<DateTime> chitDates;
  const ChitDetailAppbar({
    super.key,
    required this.chitId,
    required this.chit,
    required this.chitDates,
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

      if (shouldDelete == null || !shouldDelete) return;

      await ref.read(chitControllerProvider.notifier).deleteChit(chitId);

      if (context.mounted) {
        final controllerState = ref.read(chitControllerProvider).deleteChit;
        // todo: debug this
        actionHandler(
          controllerState,
          context,
          successCallback: () {
            context.pop();
          },
        );
      }
    }

    void onEdit() {
      context.pushNamed(
        PAGES.chitcreate.name,
        queryParameters: {
          'isEdit': "true",
        },
        extra: ChitWithDates(chit: chit, dates: chitDates),
      );
    }

    // ref.listen(
    //   chitControllerProvider,
    //   (previous, next) {
    //     if (next.deleteChit.isLoading) return;

    //     final message = next.deleteChit.isFailure
    //         ? next.deleteChit.message
    //         : "Deleted your chit successfully";

    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(message),
    //       ),
    //     );

    //     if (next.deleteChit.isSuccess) {
    //       WidgetsBinding.instance.addPostFrameCallback(
    //         (timeStamp) {
    //           Navigator.of(context).pop();
    //         },
    //       );
    //     }
    //   },
    // );

    final isLoading = ref.read(chitControllerProvider).deleteChit.isLoading;

    return AppBar(
      actions: [
        IconButton(
          onPressed: onEdit,
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
