import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});

  final Function (String identifier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 28,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Cooking Up..',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => onSelectedScreen('meals'),
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: const Text(
              'Meals',
            ),
          ),ListTile(
            onTap: ()=> onSelectedScreen('filters'),
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: const Text(
              'Filters',
            ),
          ),
        ],
      ),
    );
  }
}
