import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealDetails';

  const MealDetails({super.key});

  Widget buildTitleSection(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  Widget buildContainer(double height, Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      height: height,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildTitleSection(context, 'Ingredients'),
          buildContainer(
              150,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
          buildTitleSection(context, 'Steps'),
          buildContainer(
              160,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Text("# ${index + 1}",
                            style: const TextStyle(color: Colors.black)),
                      ),
                      title: Text(selectedMeal.steps[index],
                          style: GoogleFonts.montserrat(fontSize: 12)),
                    ),
                    const Divider(color: Colors.black),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
        ]),
      ),
    );
  }
}
