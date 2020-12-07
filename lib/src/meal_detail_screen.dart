import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/utils/app_routes.dart';

import 'maps_screen.dart';

import 'package:flutter_fiap_project2/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Descritivo'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.details.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.details[index]),
                      ),
                      color: const Color(0xffeceff1)
                      // color: Theme.of(context).colorScheme.background.alpha,
                      );
                },
              ),
            ),

            RaisedButton(
                child: Text('+ MAPA'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                padding: EdgeInsets.all(5),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed(AppRoutes.MAPS),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),

            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
              alignment: Alignment.center,
            )

            //  itemBuilder: (BuildContext context, int index) {

            //   _createSectionTitle(context, '+ Informações'),
            //   _createSectionContainer(
            // // ListView.builder(
            //       RaisedButton(
            //         child: Text('+ mapa'),
            //         color: Theme.of(context).primaryColor,
            //         textColor: Theme.of(context).textTheme.button.color,
            //         onPressed: ()=> MapUnit,
            //         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
            //         )
            //       ),
            //       //  itemBuilder: (BuildContext context, int index) {
            //       RaisedButton(
            //         child: Text('+ mapa'),
            //         color: Theme.of(context).primaryColor,
            //         textColor: Theme.of(context).textTheme.button.color,
            //         onPressed: ()=> MapUnit,
            //         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
            //         )
            //       ),
            //       //  itemBuilder: (BuildContext context, int index) {

            //       //  },

            //   // )

            //   ),

            // _createSectionTitle(context, 'Mapa'),
            // _createSectionContainer(
            //   ListView.builder(
            //     itemCount: meal.steps.length,
            //     itemBuilder: (ctx, index) {
            //       return Column(
            //         children: <Widget>[
            //           ListTile(
            //             leading: CircleAvatar(
            //               child: Text('${index + 1}'),
            //             ),
            //             title: Text(meal.steps[index]),
            //           ),
            //           Divider(),
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
