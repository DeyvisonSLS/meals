import 'package:flutter/material.dart';
import '../components/category_card.dart';
import '../data/dummy_data.dart';

class CategoriesGridScreen extends StatelessWidget {
  const CategoriesGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Meals',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryCard(category: cat);
        }).toList(),
      ),
    );
  }
}
