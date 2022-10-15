import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTle(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme
                .of(context)
                .accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTle(
              "Meal",
              Icons.restaurant,
                  () {
                Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          buildListTle(
              "Filters",
              Icons.settings,
                  () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),
        ],
      ),
    );
  }
}
