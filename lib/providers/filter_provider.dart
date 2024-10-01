import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meal_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegan: false,
          Filters.vegetarian: false,
        });

  void setFilters(Map<Filters, bool> newFilters) {
    state = newFilters;
  }

  void setFilter(Filters filter, bool newValue) {
    state = {...state, filter: newValue};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref) {
  return FilterNotifier();
});

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final Map<Filters, bool> selectedFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
