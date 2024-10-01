import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section6/providers/favorite_provider.dart';
import 'package:section6/providers/filter_provider.dart';
import 'package:section6/providers/navbar_provider.dart';
import 'package:section6/screens/filters_screen.dart';
import 'package:section6/screens/meals_screen.dart';
import 'package:section6/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'categories_screen.dart';

final Map<Filters, bool> kSelectedFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedPageIndex = ref.watch(navbarProvider);
    final setIndex = ref.read(navbarProvider.notifier).setIndex;

    final List<Meal> selectedFiltersMeal = ref.watch(filteredMealProvider);

    Widget activePage = CategoriesScreen(
      selectedFiltersMeal: selectedFiltersMeal,
    );
    var activePageTitle = 'Categories';
    final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectedScreen: (String identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FiltersScreen(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: setIndex,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      body: activePage,
    );
  }
}
