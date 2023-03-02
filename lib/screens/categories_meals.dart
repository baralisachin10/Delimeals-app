import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_Items.dart';
import 'package:flutter/material.dart';

class CategoriesMeals extends StatefulWidget {
  static const routeName = '/category_meals';

  const CategoriesMeals({super.key});

  @override
  State<CategoriesMeals> createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  String? categoryTitle;
  List<Meal>? displayMeals;

  @override
  void initState() {
    // passing arguements using pushName
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  // final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle')),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: displayMeals![index].id,
              title: displayMeals![index].title,
              imageUrl: displayMeals![index].imageUrl,
              duration: displayMeals![index].duration,
              complexity: displayMeals![index].complexity,
              affordability: displayMeals![index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayMeals!.length),
    );
  }
}
