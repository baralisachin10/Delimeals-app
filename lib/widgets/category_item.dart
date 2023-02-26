// import 'package:delimeals/screens/categories_meals.dart';
import 'package:flutter/material.dart';

import '../screens/categories_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  void selectCategory(BuildContext ctx) {
    // using pushNamed method to Navigate the screen
    Navigator.of(ctx).pushNamed(
        // MaterialPageRoute(
        //   builder: (ctx) {
        //     return CategoriesMeals(id!, title!);
        //   },
        // ),
        CategoriesMeals.routeName,
        arguments: {
          'id': id,
          'title': title,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.6),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
