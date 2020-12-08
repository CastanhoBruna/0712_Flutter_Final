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
      appBar: AppBar(
        title: Text(' Mapa '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           
            Container(
              height: 600,
              alignment: Alignment.center,
              child: GoogleMap(
            initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 11.0, 
          ),
          ),
             
            ),
          ],
        ),
      ),
    );


//  return Container(
//     appBar: AppBar(title: Text('Mapa')),
//       child: Column(
//         children: <Widget>[

//           Container(
//             margin: EdgeInsets.symmetric(vertical: 15),
//             padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
//             alignment: Alignment.center,
//             child: Text(
//               'MAPA',
//               // style: TextStyle(
//               //   fontWeight: FontWeight.w600,
//               //   fontSize: 23,
//               // ),
//             ),
//           ),
//           Container(
//           child: GoogleMap(
//             initialCameraPosition: CameraPosition(
//             target: LatLng(lat, long),
//             zoom: 11.0, 
//           ),
//           ),
//         ),
          

//         ],
//       ),
//     );
  }


  }
