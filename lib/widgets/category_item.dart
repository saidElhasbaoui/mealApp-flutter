import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: {
          'id' : id,
          'title' : title,
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(13),
      onTap: () => selectedCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(13),

        ),
      ),
    );
  }
}
