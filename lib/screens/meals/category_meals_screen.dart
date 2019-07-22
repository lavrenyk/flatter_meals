import 'package:flutter/material.dart';

import '../meals/meal_item.dart';

// подгружаем данные
import '../../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    // подгружаем список рецептов конкретной категории
    final categoryMeals = DUMMY_MEALS.where((meal) {
      // ищем наличие категории в рецепте
      return meal.categories.contains(categoryId);
    }).toList(); // обворачиваем это все в список
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
