import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:flutter/material.dart';

class ChitTabBar extends StatelessWidget {
  const ChitTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 0,
      bottom: TabBar(
        tabs: [
          Container(
            margin: EdgeInsets.only(
              bottom: SizeConfig.blockSizeVertical * 2,
            ),
            child: const Text("Chit Dates"),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: SizeConfig.blockSizeVertical * 2,
            ),
            child: const Text("Chit Payments"),
          ),
        ],
      ),
    );
  }
}
