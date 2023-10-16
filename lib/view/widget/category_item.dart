import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meals/core/const/app_color.dart';
import 'package:meals/view/screen/category_meals_screen.dart';
import 'custom_text.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;
  final String item;
  CategoryItem(this.id, this.title, this.color, this.imageUrl, this.item);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isTapped = false;
  void onTapCategory() {
    setState(() {
      isTapped = true;
    });
    Timer(Duration(seconds:1), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapCategory();
      },
      child: Stack(
        children: [
          Container(
            height: 80,
            margin: EdgeInsets.only(top: 10, left: 30, bottom: 10),
            width: 220,
            //color: Colors.red,
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
                //border: Border.all(color: Colors.grey),
                color: AppColor.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.title.toUpperCase(),
                    size: 20,
                    color: AppColor.grey,
                    wieght: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '${widget.item} Items',
                    size: 12,
                    color: AppColor.black,
                    wieght: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: widget.color),
                    height: 5,
                    width: 120,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 20),
            child: CircleAvatar(
                maxRadius: 30,
                backgroundColor: widget.color,
                backgroundImage: NetworkImage(widget.imageUrl)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 230, top: 35),
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
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(CategoryMealsScreen.routeName, arguments: {
                    'id': widget.id,
                    'title': widget.title,
                    'color': widget.color,
                  });
                },
                child: Container(
                  decoration: isTapped
                      ? BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: isTapped
                                  ? AppColor.red.withOpacity(0.5)
                                  : AppColor.black,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        )
                      : null,
                  child: CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: AppColor.white,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
