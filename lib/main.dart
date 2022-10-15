import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan'  : false,
    'vegetarian' : false
  };

  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favoriteMeals=[];

  void toggleFavorite(String mealId){
    final existingIndex=favoriteMeals.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool isMealFavorite(String id){
    return favoriteMeals.any((meal) => meal.id== id);
  }

  void setFilters(Map<String , bool> filterData){
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if(filters['gluten'] && !meal.isGlutenFree ){
          return false;}
        if(filters['lactose'] && !meal.isLactoseFree ){
          return false;}
        if(filters['vegan'] && !meal.isVegan ){
          return false;}
        if(filters['vegetarian'] && !meal.isVegetarian ){
          return false;}
        return true;
      }).toList();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 0.9),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w500,
                ),
              )),
      //home: MyHomePage(),
      routes: {
        '/': (context)=> TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName : (context)=> CategoryMealsScreen(availableMeals),
        MealDetailsScreen.routeName : (context)=> MealDetailsScreen(toggleFavorite,isMealFavorite),
        FiltersScreen.routeName : (context) => FiltersScreen(setFilters,filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
