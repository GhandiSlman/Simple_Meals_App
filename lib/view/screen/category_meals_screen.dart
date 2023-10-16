import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget { 
  static const routeName = '/category-meals';


  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      backgroundColor: categoryColor,
      appBar: AppBar(
        
        title: Text(categoryTitle!,),
        backgroundColor: categoryColor,
        elevation: 0,
      ),
      body: Container(
         margin: EdgeInsets.only(top: 20),
         decoration: BoxDecoration(
                color: Color.fromRGBO(255, 254, 229, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    
                    ),),
        child: Padding(
          padding: const EdgeInsets.only(top:20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ),
      ),
    );
  }
}
