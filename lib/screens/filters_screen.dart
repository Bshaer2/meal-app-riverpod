import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section6/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
          children: [
            buildSwitchListTile(
                context,
                'Gluten Free',
                'contains only gluten free food',
                activeFilters[Filters.glutenFree]!, (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, value);

            }),
            buildSwitchListTile(
                context,
                'Lactose Free',
                'contains only lactose free food',
                activeFilters[Filters.lactoseFree]!, (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, value);

            }),
            buildSwitchListTile(context, 'Vegan Free',
                'contains only vegan  food', activeFilters[Filters.vegan]!, (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.vegan, value);

                }),
            buildSwitchListTile(
                context,
                'Vegetarian Free',
                'contains only vegetarian  food',
                activeFilters[Filters.vegetarian]!, (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, value);

            }),
          ],
        ),

    );
  }

  SwitchListTile buildSwitchListTile(BuildContext context, String title,
      String subtitle, bool filter, Function(bool newVal) onChanged) {
    return SwitchListTile(
      title: Text(title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              )),
      subtitle: Text(subtitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              )),
      contentPadding: const EdgeInsets.only(left: 22, right: 34),
      activeColor: Theme.of(context).colorScheme.tertiaryContainer,
      value: filter,
      onChanged: onChanged,
    );
  }
}
