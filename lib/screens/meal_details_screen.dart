import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;
  static final routeName = "meal_detail";

  const MealDetailsScreen(this.toggleFavorite,this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMail.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(selectedMail.imageUrl),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMail.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMail.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx,index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text("#${index+1}"),
                        ),
                        title: Text(selectedMail.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMail.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border ,
        ),
        onPressed: (){
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
