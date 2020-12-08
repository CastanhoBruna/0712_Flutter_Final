import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/src/wifi_screen.dart';
import 'package:flutter_fiap_project2/utils/app_routes.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'costs_detail_screen.dart';
// import 'gastos.dart';
import '../components/main_drawer.dart';
import 'package:flutter_fiap_project2/model/meal.dart';
import '../utils/app_routes.dart';

 

class HomePagePos extends StatefulWidget {
  // final List<Meal> favoriteMeals;

  // const HomePagePos(this.favoriteMeals);

  @override
  _HomePagePosState createState() => _HomePagePosState();
}

class _HomePagePosState extends State<HomePagePos> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Escape Trapp',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Roteiros Favoritos',
        // 'screen': FavoriteScreen(widget.favoriteMeals),
      },
      {
        'title': 'Meus Gastos da Viagem',
        'screen': CostsDetailScreen(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
         actions: <Widget>[
          IconButton(icon: Icon(

            Icons.wifi, 
            ), 
            onPressed: ()=> Navigator.of(context).pushNamed(AppRoutes.WIFI),

          )   
            ],
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],

       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.question_answer),
        onPressed: () =>  {
          Navigator.of(context).pushNamed(AppRoutes.QUESTIONARIO),

        }
        // _openTransactionFormModal(context)
        ,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Roteiros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Gastos',
          ),
        ],
      ),
    );
  }
}
