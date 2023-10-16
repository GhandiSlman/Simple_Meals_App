import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/view/screen/category_meals_screen.dart';
import 'package:meals/view/screen/favorite_screen.dart';
import 'package:meals/view/screen/meal_details_screen.dart';

import 'models/meal.dart';
import 'view/screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   List<Meal> favoriteMeals = [];
  @override
  void initState() {
    FavoriteScreen(favoriteMeals);
    super.initState();
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isFavoriteMeal(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) =>
        MealDetailScreen(toggleFavorite, isFavoriteMeal),
        FavoriteScreen.routeName: (context) => FavoriteScreen(favoriteMeals),
      },
    );
  }
}
