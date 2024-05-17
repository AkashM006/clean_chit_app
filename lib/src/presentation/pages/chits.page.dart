import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/chit_list.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPage extends ConsumerWidget {
  const ChitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitsStream = ref.watch(chitsProvider);

    return Scaffold(
        appBar: const CustomAppBar(title: "Chits"),
        drawer: const AppDrawer(
          currentPage: PAGES.chits,
        ),
        body: switch (chitsStream) {
          AsyncData(value: final chits) => ChitList(chits: chits),
          AsyncError(:final error) => CustomErrorWidget(error.toString()),
          _ => buildLoader(context),
        });
  }

  Widget buildLoader(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading your Chits",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          const CustomLoaderWidget(),
        ],
      ),
    );
  }
}
