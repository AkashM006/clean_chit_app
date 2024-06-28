import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_detail_body.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_tab_bar.dart';
import 'package:chit_app_clean/src/presentation/widgets/chit_detail/chit_tab_view.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_error.widget.dart';
import 'package:chit_app_clean/src/utils/widgets/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChitDetailPage extends ConsumerWidget {
  const ChitDetailPage({
    super.key,
    required this.chitId,
  });

  final int chitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitDetail = ref.watch(chitProvider(chitId));

    return SafeArea(
      child: chitDetail.when(
        data: (data) => DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: ChitDetailBody(
                    chit: data.chit,
                  ),
                ),
                const ChitTabBar()
              ],
              body: ChitTabView(
                dates: data.chitDates,
                chitPayments: data.chitPayments,
                chitId: data.chit.id,
              ),
            ),
          ),
        ),
        error: (error, stackTrace) => Scaffold(
          body: CustomErrorWidget(
            error.toString(),
          ),
        ),
        loading: () => const Scaffold(
          body: CustomLoaderWidget(),
        ),
      ),
    );
  }
}
