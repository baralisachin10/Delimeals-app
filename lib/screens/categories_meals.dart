import 'package:flutter/material.dart';

class CategoriesMeals extends StatelessWidget {
  const CategoriesMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Recipe')),
      body: const Center(
          child: Text('sachin', style: TextStyle(color: Colors.black),),),
    );
  }
}
