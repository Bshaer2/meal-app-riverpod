import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section6/data/dummy_data.dart';

final mealProvider = Provider((ref){
  return dummyMeals;
});