// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_fiap_project2/model/category.dart';
import 'package:flutter_fiap_project2/model/meal.dart';




class MapUnitScreen extends StatefulWidget {
  // name({Key key}) : super(key: key);

  @override
  _MapUnitState createState() => _MapUnitState();
}

  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    // final categoryMeals = meals.where((meal) {
    //   return meal.categories.contains(category.id);
    // }).toList();
  }


class _MapUnitState extends State<MapUnitScreen> {


GoogleMapController mapController; 
double lat = -23.6193185;
double long = -46.7557933; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(title: Text(category.title)),
    appBar: AppBar(title: Text('Mapa')),
    body: GoogleMap(
      initialCameraPosition: CameraPosition(
      target: LatLng(lat, long),
      zoom: 11.0, 
    ),
    ),

    );
  }
}