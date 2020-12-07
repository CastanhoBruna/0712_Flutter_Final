import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((cat) {
        return CategoryItem(cat);
      }).toList(),
    );
  }

  // _TripData() {
  //   void getData() {
  //     FirebaseFirestore.instance
  //         .collection("sites")
  //         .get()
  //         .then((QuerySnapshot snapshot) {
  //       snapshot.docs.forEach((f) => print('${f.data}}'));
  //     });
  //   }
  // }
}

//   StreamBuilder(
//     stream:       FirebaseFirestore.instance..collection('sites').snapshots(),

//     initialData: initialData ,
//     builder: (BuildContext context, AsyncSnapshot snapshot){
//       return Container(

//         child: child,
//       );
//     },
//   ),
//   children:

//   FirebaseFirestore.instance
//     .collection('sites')
//     // .where('attending', isEqualTo: true)
//     .snapshots()
//     .listen((snapshot) {
//   _sites = snapshot.docs.length;
//   notifyListeners();
// });

//   FirebaseFirestore.instanceFor()
//   DUMMY_CATEGORIES.map((cat) {
//     return CategoryItem(cat);
//   }).toList(),

// );
