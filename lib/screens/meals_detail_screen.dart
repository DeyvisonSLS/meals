import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsDetail extends StatelessWidget {
  const MealsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Column(
          children: meal.steps.map((step) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Text(step),
            );
          }).toList(),
        ),
      ),
    );
  }
}
