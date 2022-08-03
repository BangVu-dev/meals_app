import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var categoryMeal = categoryMeals[index];
          return MealItem(
              id: categoryMeal.id,
              title: categoryMeal.title,
              imageUrl: categoryMeal.imageUrl,
              duration: categoryMeal.duration,
              complexity: categoryMeal.complexity,
              affordability: categoryMeal.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
