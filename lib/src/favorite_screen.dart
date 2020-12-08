import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
        final favorite = ModalRoute.of(context).settings.arguments as FavoriteScreen;



print(favorite); 

    if (favoriteMeals.isEmpty) {
      return Scaffold(
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                'Nenhum roteiro foi marcado como favorito! ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        ), 
      ); 


      //   child: Text('Nenhum roteiro foi marcado como favorito!'),

      // ); 
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
