import 'package:flutter/material.dart';
import 'package:meals/screens/categories_grid_screen.dart';
import 'package:meals/screens/meals_category_screen.dart';
import 'package:meals/screens/meals_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData().textTheme.copyWith(
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesGridScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => MealsCategory(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealsDetail()
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/alguma-coisa') {
          return null;
        } else if (settings.name == '/outra-coisa') {
          return null;
        } else {
          return MaterialPageRoute(
            builder: (_) {
              return CategoriesGridScreen();
            },
          );
        }
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => CategoriesGridScreen()),
    );
  }
}
