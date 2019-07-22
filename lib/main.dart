import 'package:flutter/material.dart';

import './screens/category/category_screen.dart';
import './screens/meals/category_meals_screen.dart';
import './screens/meals/meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoryScreen(),
      routes: {
        '/': (ctx) =>
            CategoryScreen(), //* default route, can be changed by InitialRoute
        '/category-meals': (ctx) => CategoryMealsScreen(),
        '/category-meals/meal-details': (ctx) => MealDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
