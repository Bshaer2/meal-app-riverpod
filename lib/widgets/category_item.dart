import 'package:flutter/material.dart';
import 'package:section6/screens/meals_screen.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.category,
      required this.selectedFiltersMeal});

  final Category category;
  final List<Meal> selectedFiltersMeal;

  @override
  Widget build(BuildContext context) {
    final filteredMeal = selectedFiltersMeal
        .where((element) => element.categories.contains(category.id))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeal,
          ),
        ));
      },
      splashColor: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            )),
        child: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
