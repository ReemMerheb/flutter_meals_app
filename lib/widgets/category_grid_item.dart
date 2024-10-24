import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({super.key,
  required this.category,required this.onSelectCategory});

  final Category category;
  final void Function ()onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding:  const EdgeInsets.all(20),
        
      
        decoration: BoxDecoration(
           color: Colors.black, 
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color.fromARGB(255, 186, 155, 70), // Gold border color
            width: 1, // Adjust the width of the border as needed
          ),
          
          
          gradient: LinearGradient
          (colors:[
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
      
          ],
          begin: Alignment.topLeft,
          end:Alignment.bottomRight,
      
           )
        ),
        child:Center(
          child: Text(
            category.title,
           style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Color.fromARGB(255, 186, 155, 70),
              shadows: [
                const Shadow(
                  blurRadius: 10.0,
                  color: Color.fromARGB(49, 255, 255, 255),
                  offset: Offset(2.0, 2.0),
                ),
              ],
          
                  ),
          ),
        )
      ),
    );
  }
}