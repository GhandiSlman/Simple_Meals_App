import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/core/const/app_color.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/view/widget/custom_text.dart';

import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite_screen';
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
         appBar: AppBar(title: CustomText(text: 'Favorite Meals', size: 20, wieght: FontWeight.bold, color: Colors.white),
         elevation: 0,
        backgroundColor: AppColor.amber,
        
        ),
        body: Center(child: CustomText(text: 'No favorite meals yet', size: 20, wieght: FontWeight.bold, color: Colors.black),),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColor.amber,
        appBar: AppBar(title: CustomText(text: 'Favorite Meals', size: 20, wieght: FontWeight.bold, color: Colors.white),
        elevation: 0,
        backgroundColor: AppColor.amber,
        ),
        body: Container(
         decoration: BoxDecoration(
                color: AppColor.color1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    
                    ),),
        child: Padding(
          padding: const EdgeInsets.only(top:20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
              );
            },
            itemCount: favoriteMeals.length,
          ),
        ),
      )
      );
    }
  }
}
