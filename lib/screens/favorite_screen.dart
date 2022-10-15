import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorite yet - start adding some!"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              id: favoriteMeals[index].id,
          );
        },
        itemCount: favoriteMeals.length,
      );

    }
  }
}
