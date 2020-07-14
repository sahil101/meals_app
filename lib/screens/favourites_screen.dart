import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favourites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        Meal m = favouriteMeals[index];
        return MealItem(
          id: m.id,
          title: m.title,
          imageUrl: m.imageUrl,
          duration: m.duration,
          affordability: m.affordability,
          complexity: m.complexity,
        );
      },
      itemCount: favouriteMeals.length,
    );
  }
}
