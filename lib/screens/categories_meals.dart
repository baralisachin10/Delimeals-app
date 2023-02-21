import 'package:flutter/material.dart';

class CategoriesMeals extends StatelessWidget {
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

    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle')),
      body: const Center(
        child: Text(
          'The list of recipes',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
