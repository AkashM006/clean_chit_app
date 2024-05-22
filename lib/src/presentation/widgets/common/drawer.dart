import 'package:chit_app_clean/src/config/home_drawer.config.dart';
import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final PAGES currentPage;
  const AppDrawer({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    void handleNavigation(String path) {
      Navigator.pop(context);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.push(path);
      });
    }

    final routeWidgets = routesMappedIntoSections.entries
        .map(
          (e) {
            List<Widget> widgets = [];
            final isSectionHavingMoreThanOneItem = e.value.length > 1;
            if (routesMappedIntoSections.keys.first != e.key &&
                isSectionHavingMoreThanOneItem) {
              // add divider to the top from the second element
              widgets.add(const Divider());
            }
            if (e.key.isNotEmpty && isSectionHavingMoreThanOneItem) {
              // add the heading if the map's key in not empty
              widgets.add(
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Text(
                    e.key,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.7),
                        ),
                  ),
                ),
              );
            }
            final result = e.value
                .map(
                  (route) => ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: route.leading,
                    onTap: route.path == currentPage.path
                        ? null
                        : () => handleNavigation(route.path),
                    title: Text(
                      route.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    selected: route.path == currentPage.path,
                    selectedTileColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                )
                .toList();
            widgets = [...widgets, ...result];
            return widgets;
          },
        )
        .toList()
        .expand((element) => element)
        .toList();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Text(
                "Chit App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: routeWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
