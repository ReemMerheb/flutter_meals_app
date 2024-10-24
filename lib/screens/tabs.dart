import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters ={
    Filter.glutenFree : false ,
    Filter.lactoseFree : false,
    Filter.vegetarien : false ,
    Filter.vegan : false,
  };
class TabsScreen extends StatefulWidget{
 const TabsScreen({super.key}); 

 @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}
class _TabsScreenState extends State <TabsScreen>{
  int _selectedPageIndex=0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter,bool> _selectedFilters = kInitialFilters;
   
   void _showInfoMessage(String message){

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)));
   }

  void _toggleMealFavoriteStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal );
    if (isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage(
        'the item is removed from favorite list');
  
    } else {
      setState(() {
         _favoriteMeals.add(meal);
      });
      _showInfoMessage(
        'The item is added to the favorite list');
     
    }
  }
  void _selectPage(int index){
    setState(() {
      
      _selectedPageIndex=index;
    });
  }

  void _setScreen(String identifier)async{
    Navigator.of(context).pop();
  if(identifier == 'filters'){
  final result=await  Navigator.of(context).push<Map<Filter,bool>>(
    MaterialPageRoute
    (builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilters,))
   );
   setState(() {
      _selectedFilters = result ?? kInitialFilters;
   });
  
  }
  }

 @override
  Widget build(BuildContext context) {
    final  availableMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
       if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
       if(_selectedFilters[Filter.vegetarien]! && !meal.isVegetarian){
        return false;
      }
       if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
    Widget activePage =  CategoriesScreen(
      onToggleFavorite:_toggleMealFavoriteStatus ,
      availableMeals: availableMeals
    ,
      );
    var activePageTitle = 'Categories';

    if(_selectedPageIndex==1){
      activePage = MealsScreen(
         meals:_favoriteMeals,
      onToggleFavorite:_toggleMealFavoriteStatus ,);
      activePageTitle='your favorites';
    }

    return Scaffold(
      
    
     appBar: AppBar(
      title: Text(activePageTitle,style: TextStyle(
      fontWeight: FontWeight.bold,  // Set the font to bold
      color: const Color.fromARGB(255, 255, 255, 255),          // Change the font color to yellow (or any color you prefer)
    ),),
      backgroundColor: Colors.black,
     ),
     

     drawer: MainDrawer(onSelectScreen: _setScreen,),
     body: Container(
      color: Colors.black,
      child: activePage),
     
     bottomNavigationBar: BottomNavigationBar(
      onTap: _selectPage,
      currentIndex: _selectedPageIndex,
       backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(
    fontWeight: FontWeight.bold,
       color: const Color.fromARGB(255, 255, 255, 255),  // Bold for the selected item
  ),
       
      items:const  [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal),label:'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.star),label:'Favorites'), 
        
        ],


     ),

    );
  }
}