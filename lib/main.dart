import 'package:delimeals/screens/categories.dart';
import 'package:delimeals/screens/categories_meals.dart';
// import 'package:delimeals/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delimeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255, 214, 213, 194),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              titleLarge: GoogleFonts.robotoCondensed(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      // defining routes for the screen
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesScreen(),
        CategoriesMeals.routeName: (context) => CategoriesMeals(),
      },
    );
  }
}
