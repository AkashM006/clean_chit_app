import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/appbar.dart';
import 'package:chit_app_clean/src/presentation/widgets/common/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Home",
      ),
      drawer: AppDrawer(
        currentPage: PAGES.home,
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
