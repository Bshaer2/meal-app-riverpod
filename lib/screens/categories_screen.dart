import 'package:flutter/material.dart';
import 'package:section6/widgets/category_item.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.selectedFiltersMeal});

  final List<Meal> selectedFiltersMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(seconds: 1));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(

        animation: _controller,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2),
          children: [
            for (final singleCategory in availableCategories)
              CategoryItem(
                category: singleCategory,
                selectedFiltersMeal: widget.selectedFiltersMeal,
              )
          ],
        )
    ,
    builder: (ctx, child) => SlideTransition(
    position: Tween<Offset>(
    begin: const Offset(0, 0.3), end: const Offset(0.0, 0.0))
        .animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo),
    ),
    child: child),);
  }
}
