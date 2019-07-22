import 'package:flutter/material.dart';

import '../../dummy-data.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              selectedMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'Ingredients'),
            sectionContainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'Steps to prepare'),
            sectionContainer(
              height: 300,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  // Sectinal Widgets
  Widget sectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget sectionContainer({Widget child, double height = 200}) {
    return Container(
      height: height,
      width: 350,
      // margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
