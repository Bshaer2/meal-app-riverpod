import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class NavbarNotifier extends StateNotifier<int> {
  NavbarNotifier() : super(0);
  void setIndex(int index){
    state = index;
  }
}

final navbarProvider =
StateNotifierProvider<NavbarNotifier, int>((ref) {
  return NavbarNotifier();
});
