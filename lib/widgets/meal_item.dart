import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal,});

  final Meal meal;
  final void Function (Meal meal) onSelectMeal;

  String get complexityText {
    switch (meal.complexity) {
      case (Complexity.simple):
        return 'Simple';
      case (Complexity.challenging):
        return 'Challenging';
      case (Complexity.hard):
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case (Affordability.affordable):
        return 'Affordable';
      case (Affordability.pricey):
        return 'Pricey';
      case (Affordability.luxurious):
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: ()=> onSelectMeal(meal),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.schedule, color: Colors.white,),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '${meal.duration} min',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.work,color: Colors.white,),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(complexityText,style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.attach_money,color: Colors.white,),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(affordabilityText,style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
