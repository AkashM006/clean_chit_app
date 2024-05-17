import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chits/chit_list.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/extendable_fab.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitPage extends ConsumerStatefulWidget {
  const ChitPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChitPageState();
}

class _ChitPageState extends ConsumerState<ChitPage> {
  bool isFabExtended = true;

  final ScrollController _scrollController = ScrollController();

  void scrollHandler() {
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        isFabExtended) {
      setState(() {
        isFabExtended = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        !isFabExtended) {
      setState(() {
        isFabExtended = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(scrollHandler);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void createHandler() {
    // todo: need to implement this
    // ref.read(chitFormNotifierProvider.notifier).setFormMode(FormMode.create);
    // showChitBottomSheet(context);
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chitsStream = ref.watch(chitsProvider);

    return Scaffold(
        appBar: const CustomAppBar(title: "Chits"),
        floatingActionButton: ExtendableFab(
          onClickHandler: createHandler,
          text: "Create chit",
          icon: const Icon(Icons.add),
          controller: scrollController,
        ),
        drawer: const AppDrawer(
          currentPage: PAGES.chits,
        ),
        body: switch (chitsStream) {
          AsyncData(value: final chits) => ChitList(
              chits: chits,
              controller: scrollController,
            ),
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
