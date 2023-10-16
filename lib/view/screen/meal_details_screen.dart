import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/core/const/app_color.dart';
import 'package:meals/view/screen/category_meals_screen.dart';
import 'package:meals/view/widget/custom_icon_button.dart';

import '../../dummy_data.dart';
import '../../test.dart';
import '../widget/custom_text.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routArgs['id'];
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.network(
                  selectedMeals.imageUrl,
                  fit: BoxFit.cover,
                  height: 300, // Adjust the height as needed
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: AppColor.white,
                        ),
                        height: 400, // Adjust the height as needed
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 5,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    AppColor.purple,
                                    AppColor.red,
                                    AppColor.orange,
                                    AppColor.amber,
                                    AppColor.blue,
                                    AppColor.green,
                                    AppColor.lightBlue,
                                    AppColor.lightGreen,
                                    AppColor.pink,
                                    AppColor.teal,
                                  ])),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Healthy Meal',
                              size: 20,
                              color: AppColor.black,
                              wieght: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: selectedMeals.title,
                              size: 15,
                              color: AppColor.grey,
                              wieght: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text:
                                      '${selectedMeals.duration.toString()} MIN',
                                  size: 17,
                                  color: AppColor.black,
                                  wieght: FontWeight.normal,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CustomText(
                                  text: selectedMeals.affordability.name
                                      .toUpperCase(),
                                  size: 17,
                                  color: AppColor.black,
                                  wieght: FontWeight.normal,
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColor.grey2,
                              endIndent: 20,
                              indent: 20,
                            ),
                            // SizedBox(height: 5,),
                            Icon(Icons.arrow_drop_down_sharp,
                                color: AppColor.amber),
                            //   SizedBox(height: ,),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: 'Ingredints',
                                      size: 20,
                                      color: AppColor.black,
                                      wieght: FontWeight.normal,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              selectedMeals.ingredients.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  selectedMeals
                                                      .ingredients[index],
                                                  textAlign: TextAlign.start,
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: AppColor.grey,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text: 'Steps',
                                      size: 20,
                                      color: AppColor.black,
                                      wieght: FontWeight.normal,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: selectedMeals.steps.length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                              selectedMeals.steps[index],
                                              textAlign: TextAlign.start,
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            child:
                            CustomIconButton(
                              icon: Icon(
                                  isFavorite(mealId)
                                      ? Icons.favorite
                                      : Icons.favorite_outline_rounded,
                                  color: isFavorite(mealId)
                                      ? AppColor.red
                                      : AppColor.black,
                                ), onPressed: () => toggleFavorite(mealId),
                                toolLip: 'Favorite',
                                )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
