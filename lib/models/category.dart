import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;
  final String item;
  const Category({
    required this.id,
    required this.imageUrl,
    required this.item,
    required this.title,
    required this.color,
  });
}
