
// import * as functions from 'firebase-functions';
// import { functions } from 'firebase-functions';

// import * as admin from 'firebase-admin';

// import 'package:firebase_admin_interop/firebase_admin_interop.dart';
// import 'package:firebase_functions_interop/firebase_functions_interop.dart';


// admin.initializeApp();

// const db = admin.firestore();
// const fcm = admin.messaging();

// export const sendToTopic = functions.firestore
//   .document('puppies/{puppyId}')
//   .onCreate(async snapshot => {
//     const puppy = snapshot.data();

//     const payload: admin.messaging.MessagingPayload = {
//       notification: {
//         title: 'New Puppy!',
//         body: `${puppy.name} is ready for adoption`,
//         icon: 'your-icon-url',
//         click_action: 'FLUTTER_NOTIFICATION_CLICK' // required only for onResume or onLaunch callbacks
//       }
//     };

//     return fcm.sendToTopic('puppies', payload);
//   });
