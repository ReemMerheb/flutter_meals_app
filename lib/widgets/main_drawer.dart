import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration:const  BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                   Color.fromRGBO(23, 96, 62, 0.21), // Mint Green Color.fromARGB(54, 23, 96, 62),
      Color.fromRGBO(23, 96, 62, 0.21),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                 const  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Color.fromARGB(255, 186, 155, 70),
                  ),
                  const SizedBox(width: 18),
                  Text(
                    'Cooking Up!!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color.fromARGB(255, 186, 155, 70),
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading:const Icon(
                Icons.restaurant,
                size: 26,
                color: Color.fromARGB(255, 186, 155, 70),
              ),
              title: Text('Meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 24,
                      )),
              onTap: () {
                onSelectScreen('meals');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 26,
                color: Color.fromARGB(255, 186, 155, 70),
              ),
              title: Text('Filters',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 24,
                      )),
              onTap: () {
                onSelectScreen('filters');
              },
            ),
          ],
        ),
      ),
    );
  }
}
