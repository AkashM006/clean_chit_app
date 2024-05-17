import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:flutter/material.dart';

class ChitPage extends StatelessWidget {
  const ChitPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Chits"),
      drawer: AppDrawer(
        currentPage: PAGES.chits,
      ),
      body: Center(
        child: Text("Chits"),
      ),
    );
  }
}
