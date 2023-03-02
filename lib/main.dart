import 'package:delimeals/screens/categories.dart';
import 'package:delimeals/screens/categories_meals.dart';
import 'package:delimeals/screens/meal_details.dart';
import 'package:delimeals/screens/tabs_screen.dart';
// import 'package:delimeals/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/filter_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delimeals',
      theme: ThemeData(
        // canvasColor: Colors.pink.shade100,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              titleLarge: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: const CategoriesScreen(),
      // defining routes for the screen
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        CategoriesMeals.routeName: (context) => const CategoriesMeals(),
        MealDetails.routeName: (context) => const MealDetails(),
        FilterScreen.routeName: (context) => const FilterScreen(),
      },

      // ongenerate route
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },

      // on unknown routes takes a function
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => const CategoriesScreen()),
    );
  }
}
