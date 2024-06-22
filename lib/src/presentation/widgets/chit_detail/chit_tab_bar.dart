import 'package:flutter/material.dart';

class ChitTabBar extends StatelessWidget {
  const ChitTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      toolbarHeight: 0,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Text("Dates"),
          ),
          Tab(
            child: Text("Payments"),
          ),
        ],
      ),
    );
  }
}
