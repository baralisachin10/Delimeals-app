import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screens/categories.dart';
import 'package:delimeals/screens/categories_meals.dart';
import 'package:delimeals/screens/meal_details.dart';
import 'package:delimeals/screens/tabs_screen.dart';
// import 'package:delimeals/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/filter_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  final List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoriesMeals.routeName: (context) =>
            CategoriesMeals(_availableMeals),
        MealDetails.routeName: (context) => const MealDetails(),
        FilterScreen.routeName: (context) => FilterScreen(_setFilters),
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
