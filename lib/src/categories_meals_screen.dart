import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/src/widgets.dart';

import '../components/meal_item.dart';
import '../model/category.dart';
import '../model/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  @override  
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      
      appBar: AppBar(
               title: Text(category.title),

      ),   
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
      ),


      
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection('sites').snapshots(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot){

      //       return Container(
      //         child: ListView.builder(
      //               itemCount: categoryMeals.length,
      //           itemBuilder: (ctx, index) {
      //     return MealItem(categoryMeals[index]
      //         );
      //       }
      //     )

      //       );
      //     },
      //   ),

        



    );
  }
}
