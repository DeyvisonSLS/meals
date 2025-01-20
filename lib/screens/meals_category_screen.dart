import 'package:flutter/material.dart';
import 'package:meals/components/meal_card.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class MealsCategory extends StatelessWidget {
  const MealsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealCard(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
