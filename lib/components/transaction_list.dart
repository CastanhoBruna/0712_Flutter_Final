import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';
import '../utils/app_routes.dart';

// import 'package:flutter/flare_flutter/flare_actor.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

   
  @override
  Widget build(BuildContext context) {
    // var _imagem;
        return Container(
          height: 300,
          child: transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Nenhum gasto cadastrado!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 130,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                    child: Image.asset(
                      'assets/costs.png',

                        fit: BoxFit.cover,

                        ),
                      )
                  ),

            //       FlatButton(
            // color: Colors.blueGrey,
            // textColor: Colors.white,
            // onPressed: () {
            //   // exibitokenFirebase(); 
            //                 //
            //               },
            //               child: Text(
            //                 "Instagram",
            //                 style: TextStyle(fontSize: 20.0),
            //               ),
            //             ),
                            
                            ],
                          )
                        : ListView.builder(
                            itemCount: transactions.length,
                            itemBuilder: (ctx, index) {
                              final tr = transactions[index];
                              return Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 5,
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: FittedBox(
                                        child: Text('R\$${tr.value}'),
                                      ),
                                    ),
                                  ),
                                  isThreeLine: true,
                                  title: Text(
                                    tr.titletrip,
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  subtitle: Text(
                                    tr.title + '   ' +  DateFormat('d MMM y').format(tr.date), 
                                    // style: Theme.of(context).textTheme.headline6,
                                    
                                  ),
                                  
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Theme.of(context).errorColor,
                                    onPressed: () => onRemove(tr.id),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                }
              }
              


//               void exibitokenFirebase() {
//                  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   FirebaseMessaging.getInstance().getToken(); 

//   print("FirebaseMessaging token >>>>>>>>>>>>>: $token");
// }




// class SpringCurve extends Curve {
//   const SpringCurve({
//     this.a = 0.15,
//     this.w = 19.4,
//   });
//   final double a;
//   final double w;

//   @override
//   double transformInternal(double t) {
//     return -(pow(e, -t / a) * cos(t * w)) + 1;
//   }
// }
