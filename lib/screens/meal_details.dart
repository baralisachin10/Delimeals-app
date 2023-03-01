import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealDetails';

  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is meal Detail page',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
