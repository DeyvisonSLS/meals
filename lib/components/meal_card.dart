import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  void _openMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.MEAL_DETAIL, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: meal.imageUrl.isNotEmpty
                      ? Image.network(
                          meal.imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 250,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.broken_image_outlined,
                                    color: Colors.grey[400],
                                    size: 50,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey[400],
                            size: 50,
                          ),
                        ),
                ),
                Positioned(
                  width: 250,
                  bottom: 10,
                  right: 0,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 150,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(16),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily:
                            Theme.of(context).textTheme.titleLarge?.fontFamily,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 16.0,
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withAlpha(128),
                          ),
                        ],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${meal.duration} min",
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontWeight),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        meal.getComplexity,
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontWeight),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        meal.getAffordability,
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontWeight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
