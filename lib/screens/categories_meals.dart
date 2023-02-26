import 'package:delimeals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesMeals extends StatelessWidget {
  static const routeName = '/category_meals';

  const CategoriesMeals({super.key});
  // final String? id;
  // final String? mealTitle;
  // const CategoriesMeals(this.id, this.mealTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    // passing arguements using pushName
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle')),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(
              categoryMeals[index].title,
              style: const TextStyle(color: Colors.black),
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
