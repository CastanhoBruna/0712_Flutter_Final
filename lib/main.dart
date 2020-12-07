import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/data/dummy_data.dart';
import 'package:flutter_fiap_project2/listBills.dart';
import 'package:flutter_fiap_project2/mobx/paymentController.dart';
import 'package:flutter_fiap_project2/src/about_screen.dart';
import 'package:flutter_fiap_project2/src/categories_meals_screen.dart';
import 'package:flutter_fiap_project2/src/costs_detail_screen.dart';
import 'package:flutter_fiap_project2/src/firebasetest_screen.dart';
import 'package:flutter_fiap_project2/src/questionario_screen.dart';
import 'package:flutter_fiap_project2/src/home_posauth_screen.dart';
import 'package:flutter_fiap_project2/src/meal_detail_screen.dart';
import 'package:flutter_fiap_project2/src/push_notifications_screen.dart';
import 'package:flutter_fiap_project2/src/home_preauth_screen.dart';
import 'package:flutter_fiap_project2/src/wifi_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:battery/battery.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/meal.dart';
import 'src/authentication.dart';
import 'src/maps_screen.dart';
import 'src/widgets.dart';

import 'utils/app_routes.dart';


void main() async {
  GetIt.I.registerSingleton<PaymentController>(PaymentController());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => MyApp(),
    ),
    );
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



// class MyApp extends StatelessWidget {

    List<Meal> _availableMeals = DUMMY_MEALS;
      List<Meal> _favoriteMeals = [];

      
  
  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Projeto Escape trapp',
            debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.indigo,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //mobx

home: HomePage(),

 routes: {
        // AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.COSTS_DETAIL: (_) => CostsDetailScreen(),
        AppRoutes.MAPS: (_) => MapUnitScreen(),
        AppRoutes.ABOUT: (_) => AboutScreen(),
        AppRoutes.WIFI: (_) => WifiScreen(),
        AppRoutes.FIREBASE: (_) => FirebaseScreen(),
        AppRoutes.HOME_APP: (_) => HomePagePos(),
        AppRoutes.QUESTIONARIO: (_) => QuestionarioScreen(),
        // AppRoutes.HOME_APP: (ctx) => HomePagePos(_favoriteMeals),
        // AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
        // AppRoutes.PUSH: (_) => PushNotificationScreen(),
      },
      
      // home: ListBills(),
      //provider
      /*home: ChangeNotifierProvider(
        create: (context) => PaymentController(),
        child: ListBills(),
      ),*/
      // home: ChangeNotifierProvider(
      //   create: (context) => PaymentController(),
      //   child: HomePage(),
      // ),
      
    );
  }
}

