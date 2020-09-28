import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category _category;
  List<Meal> _displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final _routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Category>;
      _category = _routeArgs['category'];
      
      _displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(_category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(_displayedMeals[index]);
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
