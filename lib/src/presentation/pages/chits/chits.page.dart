import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/chit_list.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitPage extends ConsumerWidget {
  const ChitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void createHandler() {
      context.push(PAGES.chitcreate.path);
    }

    final chitsStream = ref.watch(chitsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "Chits"),
      drawer: const AppDrawer(
        currentPage: PAGES.chits,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createHandler,
        child: const Icon(Icons.add),
      ),
      body: switch (chitsStream) {
        AsyncData(value: final chitsWithDates) => ChitList(
            chitsWithDates: chitsWithDates,
          ),
        AsyncError(:final error) => CustomErrorWidget(error.toString()),
        _ => const CustomLoaderWidget(
            text: "Loading your Chits",
          ),
      },
    );
  }
}
