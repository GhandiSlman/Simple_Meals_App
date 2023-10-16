import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for AppLifecycleState
import 'package:meals/core/const/app_color.dart';
import 'package:meals/view/screen/favorite_screen.dart';
import 'package:meals/view/widget/category_item.dart';
import 'package:meals/view/widget/custom_icon_button.dart';

import '../../dummy_data.dart';
import '../../models/meal.dart';
import '../widget/custom_text.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  CategoriesScreen(this.favoriteMeals);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  // Add WidgetsBindingObserver
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Add observer for app lifecycle changes
    WidgetsBinding.instance.addObserver(this);

    // Start the animation when the screen is loaded
    _animationController.forward();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // Start the animation when the app is resumed
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();

    // Remove the observer when the widget is disposed
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // ... Rest of your code ...
        Scaffold(
      backgroundColor: AppColor.amber,
      appBar: AppBar(
        actions: [
          CustomIconButton(icon: Icon(Icons.favorite_outline_rounded), onPressed: (){
            Navigator.of(context).pushNamed(FavoriteScreen.routeName);
          }),
          Padding(padding: EdgeInsets.only(left: 15))
        ],
        elevation: 0,
        title: CustomText(
          text: 'Meals',
          color: AppColor.white,
          size: 20,
          wieght: FontWeight.normal,
        ),
        backgroundColor: AppColor.amber,
      ),
      body: SafeArea(
        child: SlideTransition(
            position: _animation,
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    color: AppColor.color1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 100,
                        top: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: AppColor.amber,
                          ),
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView(
                          children: DUMMY_CATEGORIES
                              .map((catData) => CategoryItem(
                                  catData.id,
                                  catData.title,
                                  catData.color,
                                  catData.imageUrl,
                                  catData.item))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
