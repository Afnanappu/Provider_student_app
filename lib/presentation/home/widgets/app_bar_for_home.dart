import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/home/grid_and_search_simple_state_provider.dart';

class AppBarForHome extends StatelessWidget {
  const AppBarForHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      actions: [
        IconButton(
            onPressed: () =>
                Provider.of<IsGridOrSearchController>(context, listen: false)
                    .toggleIsSearchOn(),
            icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () =>
              Provider.of<IsGridOrSearchController>(context, listen: false)
                  .toggleIsGrid(),
          icon: Consumer<IsGridOrSearchController>(
            builder: (BuildContext context, value, Widget? _) {
              return !value.isGrid
                  ? const Icon(Icons.grid_view_rounded)
                  : const Icon(
                      Icons.format_list_bulleted_rounded,
                    );
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
