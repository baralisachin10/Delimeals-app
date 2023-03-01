import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealDetails';

  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: Column(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(selectedMeal.imageUrl),
        )
      ]),
    );
  }
}
