import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/components/transaction_list.dart';
import 'package:flutter_fiap_project2/model/meal.dart';
import 'package:flutter_fiap_project2/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fiap_project2/src/widgets.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';
import 'widgets.dart';


// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }

//   Future<void> init() async {
//     await Firebase.initializeApp();

//     // Add from here
//     FirebaseFirestore.instance
//         .collection('attendees')
//         .where('attending', isEqualTo: true)
//         .snapshots()
//         .listen((snapshot) {
//       _attendees = snapshot.docs.length;
//       notifyListeners();
//     });

//     FirebaseFirestore.instance
//         .collection('sites')
//         .snapshots()
//         .listen((snapshot) {
//       _sites = [];
//       notifyListeners();
//     });

//     FirebaseFirestore.instance
//         .collection('transactions')
//         .snapshots()
//         .listen((snapshot) {
//       _transactions = [];
//       notifyListeners();
//     });

//     // To here

//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//         _guestBookSubscription = FirebaseFirestore.instance
//             .collection('guestbook')
//             .orderBy('timestamp', descending: true)
//             .snapshots()
//             .listen((snapshot) {
//           _guestBookMessages = [];
//           snapshot.docs.forEach((document) {
//             _guestBookMessages.add(
//               GuestBookMessage(
//                 name: document.data()['name'],
//                 message: document.data()['text'],
//               ),
//             );
//           });
//           notifyListeners();
//         });

//         // Add from here
//         _attendingSubscription = FirebaseFirestore.instance
//             .collection('attendees')
//             .doc(user.uid)
//             .snapshots()
//             .listen((snapshot) {
//           if (snapshot.data() != null) {
//             if (snapshot.data()['attending']) {
//               _attending = Attending.yes;
//             } else {
//               _attending = Attending.no;
//             }
//           } else {
//             _attending = Attending.unknown;
//           }
//           notifyListeners();
//         });
//         // to here
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//         _guestBookMessages = [];
//         _guestBookSubscription?.cancel();
//         _attendingSubscription?.cancel(); 
//       }
//       notifyListeners();
//     });
//   }

//   ApplicationLoginState _loginState;
//   ApplicationLoginState get loginState => _loginState;

//   String _email;
//   String get email => _email;

//   StreamSubscription<QuerySnapshot> _guestBookSubscription;
//   List<GuestBookMessage> _guestBookMessages = [];
//   List<GuestBookMessage> get guestBookMessages => _guestBookMessages;

//   List<SiteTrips> _sites = [];
//   List<TransactionList> _transactions = [];

//   int _attendees = 0;
//   int get attendees => _attendees;

//   Attending _attending = Attending.unknown;
//   StreamSubscription<DocumentSnapshot> _attendingSubscription;
//   Attending get attending => _attending;
//   set attending(Attending attending) {
//     final userDoc = FirebaseFirestore.instance
//         .collection('attendees')
//         .doc(FirebaseAuth.instance.currentUser.uid);
//     if (attending == Attending.yes) {
//       userDoc.set({'attending': true});
//     } else {
//       userDoc.set({'attending': false});
//     }
//   }

//   void startLoginFlow() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }

//   void verifyEmail(
//     String email,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       var methods =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }

//   void signInWithEmailAndPassword(
//     String email,
//     String password,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }

//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }

//   void registerAccount(String email, String displayName, String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user.updateProfile(displayName: displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }

//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   Future<DocumentReference> addMessageToGuestBook(String message) {
//     if (_loginState != ApplicationLoginState.loggedIn) {
//       throw Exception('Must be logged in');
//     }

//     return FirebaseFirestore.instance.collection('guestbook').add({
//       'text': message,
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//       'name': FirebaseAuth.instance.currentUser.displayName,
//       'userId': FirebaseAuth.instance.currentUser.uid,
//     });
//   }
// }

class SiteTrips {
  SiteTrips(
    final String id,
    final List<String> categories,
    final String title,
    final String latitude,
    final String longitude,
    final String location,
    final String imageUrl,
    final List<String> details,
    final List<String> steps,
    final String duration,
    final bool isGlutenFree,
    final bool isLactoseFree,
    final bool isVegan,
    final bool isVegetarian,
    final Complexity complexity,
    final Cost cost,
  );
}




class GuestBookMessage {
  GuestBookMessage({@required this.name, @required this.message});
  final String name;
  final String message;
}

enum Attending { yes, no, unknown }

class ChatScreen extends StatefulWidget {
  ChatScreen({@required this.addMessage, @required this.messages});
  final Future<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<ChatScreen> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Chat '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                ' Envie uma mensagem para seu companheiro de viagem ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Deixe uma mensagem',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Deixe sua mensagem para continuar';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    StyledButton(
                      child: Row(
                        children: [
                          Icon(Icons.send),
                          SizedBox(width: 4),
                          Text('Enviado'),
                        ],
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await widget.addMessage(_controller.text);
                          _controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),
            // for (var message in widget.messages)
            //   Paragraph('${message.name}: ${message.message}'),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}




class YesNoSelection extends StatelessWidget {
  const YesNoSelection({@required this.state, @required this.onSelection});
  final Attending state;
  final void Function(Attending selection) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                child: Text('YES'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              TextButton(
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
      case Attending.no:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                child: Text('YES'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              StyledButton(
                child: Text('YES'),
                onPressed: () => onSelection(Attending.yes),
              ),
              SizedBox(width: 8),
              StyledButton(
                child: Text('NO'),
                onPressed: () => onSelection(Attending.no),
              ),
            ],
          ),
        );
    }
  }
}


