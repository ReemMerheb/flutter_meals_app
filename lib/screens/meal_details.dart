import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal,required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          backgroundColor: Colors.black,
        
        actions:[
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          },
           icon: const Icon(Icons.star),),
        ]),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              
              
              children: [
                Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 14),
                Text('Ingredients',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color.fromARGB(255, 186, 155, 70),
                        fontWeight: FontWeight.bold,
                        fontSize: 23,)),
                const SizedBox(height: 14),
                for (final ingredient in meal.ingredients)
                  Text(ingredient,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          )),
                const SizedBox(height: 14),
                Text('Steps',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color.fromARGB(255, 186, 155, 70),
                        fontWeight: FontWeight.bold,
                        fontSize:  23)),
                const SizedBox(height: 14),
                for (final step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    child: Text(step,
                    textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            )),
                  ),
              ],
            ),
          ),
        ));
  }
}
