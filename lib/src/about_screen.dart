import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart' show visibleForTesting;
import 'package:mime/mime.dart' show lookupMimeType;
import 'package:flutter_fiap_project2/services/textoget_service.dart';
import 'package:flutter_fiap_project2/service_locator.dart';

class AboutScreen extends StatelessWidget {
  // USO DE GETIT PARA O APP DE FLUTTER
  var textoGet = locator<TextoGetService>();

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
            alignment: Alignment.center,
            
            child: Text(
                      
              textoGet.textoGet.toString(), 
            
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
            alignment: Alignment.center,
            child: Text(
              'Redes Sociais',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                // color: Theme.of(context).accentColor,
              ),
            ),
          ),
          FlatButton(
            color: Colors.blueGrey,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(10.0),
            splashColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              _launchURLF();
              //
            },
            child: Text(
              "Facebook",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          FlatButton(
            color: Colors.blueGrey,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(10.0),
            splashColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              _launchURLI();
              //
            },
            child: Text(
              "Instagram",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          FlatButton(
            color: Colors.blueGrey,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(10.0),
            splashColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              _launchURLY();
              //
            },
            child: Text(
              " Youtube ",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          FlatButton(
            color: Colors.lightBlue[800],
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(10.0),
            splashColor: Colors.blueAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              _onShare(context);
              // Share.share('Da uma olhada nesse app que bacana - https://escapetripSITE.com');
            },
            child: Text(
              " Recomende este aplicativo ",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject();

    print('caiu aquii');

    // if (imagePaths.isNotEmpty) {
    //   await Share.shareFiles(imagePaths,
    //       text: text,
    //       subject: subject,
    //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    // } else {
    await Share.share(
        'Da uma olhada nesse app que bacana - https://escapetrappSITE.com',
        subject: "Novo app",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    // }
  }

  _launchURLF() async {
    const url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLI() async {
    const url = 'https://instagram.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLY() async {
    const url = 'https://youtube.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o Escape Trapp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
              width: double.infinity,
            ),
            _createSectionTitle(context, 'Testar'),
            Container(
              height: 70,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Share {
  @visibleForTesting
  static const MethodChannel channel =
      MethodChannel('plugins.flutter.io/share');

  static Future<void> share(
    String text, {
    String subject,
    Rect sharePositionOrigin,
  }) {
    assert(text != null);
    assert(text.isNotEmpty);

    final Map<String, dynamic> params = <String, dynamic>{
      'text': text,
      'subject': subject,
    };

    if (sharePositionOrigin != null) {
      params['originX'] = sharePositionOrigin.left;
      params['originY'] = sharePositionOrigin.top;
      params['originWidth'] = sharePositionOrigin.width;
      params['originHeight'] = sharePositionOrigin.height;
    }

    return channel.invokeMethod<void>('share', params);
  }

  static String _mimeTypeForPath(String path) {
    assert(path != null);
    return lookupMimeType(path) ?? 'application/octet-stream';
  }
}
