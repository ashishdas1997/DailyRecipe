import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'Filters_screen.dart';
import 'tabs_screen.dart';
import 'meal_detail_screen.dart';
import './category_meals_screen.dart';
import 'meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
        return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          // ignore: missing_return, missing_return
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          // ignore: missing_return, missing_return
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          // ignore: missing_return, missing_return
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 249, 1),
          fontFamily: 'Playfair Display',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
              ))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters,setFilters),
      },
    );
  }
}
