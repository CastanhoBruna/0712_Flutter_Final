import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fiap_project2/src/widgets.dart';
import 'package:provider/provider.dart';

class TripOptionForm extends StatefulWidget {
  TripOptionForm({
    @required this.tripoption,
    @required this.cancel,
    this.registerOption,
  });

  final String tripoption;
  final void Function() cancel;
  final void Function(
    String tripoption,
    // void Function(Exception e) error,
  ) registerOption;

  @override
  _TripOptionFormState createState() => _TripOptionFormState();
}

class _TripOptionFormState extends State<TripOptionForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_TripOptionFormState');
  final _tripOptionController = TextEditingController();

// class QuestionarioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Seu próximo Roteiro '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                ' Qual o próximo roteiro que devemos disponibilizar ? ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: _tripOptionController,
                decoration: const InputDecoration(
                  hintText: 'Roteiro',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Indicar pra onde ir r';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: widget.cancel,
                    child: Text('Cancelar'),
                  ),
                  SizedBox(width: 16),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        widget.registerOption(
                          _tripOptionController.text,
                        );
                      }
                        popsalva();
                    },
                    child: Text('Salvar'),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



popsalva() async {
    _exibirDialog('Roteiro', ' Solicitação encaminhada. ');
}

_exibirDialog(title, text) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

 showAlertDialog1(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(" "),
      content: Text(" "),
      actions: [
        okButton,
      ],
    );

    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

}


// 'use strict';

// const functions = require('firebase-functions');
// const admin = require('firebase-admin');
// admin.initializeApp();
// const nodemailer = require('nodemailer');

// // Configure the email transport using the default SMTP transport and a GMail account.
// // For other types of transports such as Sendgrid see https://nodemailer.com/transports/
// // TODO: Configure the `gmail.email` and `gmail.password` Google Cloud environment variables.

// const gmailEmail = encodeURIComponent(functions.config().gmail.email);
// const gmailPassword = encodeURIComponent(functions.config().gmail.password);
// const mailTransport = nodemailer.createTransport(
//     `smtps://${gmailEmail}:${gmailPassword}@smtp.gmail.com`);

// // TODO: Create yor own survey.
// const LINK_TO_SURVEY = 'https://goo.gl/forms/IdurnOZ66h3FtlO33';
// const LATEST_VERSION = '2.0';

// /**
//  * After a user has updated the app. Send them a survey to compare the app with the old version.
//  */
// exports.sendAppUpdateSurvey = functions.analytics.event('app_update').onLog(async (event) => {
//   const uid = event.user.userId;
//   const appVerion = event.user.appInfo.appVersion;

//   // Check that the user has indeed upgraded to the latest version.
//   if (appVerion === LATEST_VERSION) {
//     // Fetch the email of the user. In this sample we assume that the app is using Firebase Auth and
//     // has set the Firebase Analytics User ID to be the same as the Firebase Auth uid using the
//     // setUserId API.
//     const user = await admin.auth().getUser(uid);
//     const email = user.email;
//     const name = user.displayName;
//     return sendSurveyEmail(email, name);
//   }
//   return null;
// });

// /**
//  * Sends an email pointing to the Upgraded App survey.
//  */
// async function sendSurveyEmail(email, name) {
//   const mailOptions = {
//     from: '"MyCoolApp" <noreply@firebase.com>',
//     to: email,
//     subject: 'How did you like our new app?',
//     text: `Hey ${name}, We've seen that you have upgraded to the new version of our app!
//            It would be awesome if you could tell us how you like it.
//            Fill out our survey: ${LINK_TO_SURVEY}`,
//   };

//   await mailTransport.sendMail(mailOptions);
//   console.log('Upgrade App Survey email sent to:', email);
// }
