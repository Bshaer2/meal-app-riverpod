import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section6/providers/favorite_provider.dart';

import '../models/meal.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> filteredMeal = ref.watch(favoriteMealsProvider);
    bool isFavorite = filteredMeal.contains(meal);
    log(isFavorite.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              bool wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .onToggleFavoritesMeal(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Added to favorite,$isFavorite'
                      : 'No longer in favorite, $isFavorite')));
            },
            icon: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border_outlined,
                  color: Colors.amber,
                  key: ValueKey(isFavorite),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: meal.id, child: Image.network(meal.imageUrl)),
            const SizedBox(height: 8),
            Text(
              'Ingredients',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 8),
            for (var ingredient in meal.ingredients)
              Text(
                ingredient,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            const SizedBox(height: 20),
            Text(
              'Steps',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            for (var step in meal.steps)
              Text(
                step,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
