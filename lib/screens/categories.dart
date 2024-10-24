import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({super.key,required this.onToggleFavorite,required this.availableMeals});
  final List<Meal> availableMeals;

  final void Function (Meal meal) onToggleFavorite;
  void _selectCategory(BuildContext context,Category category ) {
     final  filteredMeals = availableMeals
     .where((meal ) => meal.categories.contains(
      category.id)).toList();
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals:filteredMeals,
          onToggleFavorite: onToggleFavorite,

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
       margin: EdgeInsets.all(17),
      color: Color.fromARGB(255, 0, 0, 0),
      

      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/ 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            
          ),
            children: [
              // fini esta3m3l li taht l for aw hay la
              // jib lcategories
              // availableCategories.map((category)=>CategoryGridItem(category:category)).toList()
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context,category);
                  },
                )
            ],
          ),
    );
  }
}
