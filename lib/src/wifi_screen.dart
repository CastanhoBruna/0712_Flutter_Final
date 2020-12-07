import 'package:battery/battery.dart';
import 'dart:async';
import 'package:battery_platform_interface/battery_platform_interface.dart';
export 'package:battery_platform_interface/battery_platform_interface.dart'
    show BatteryState;

import 'package:flutter/material.dart';
import 'package:flutter_fiap_project2/utils/app_routes.dart';
import 'package:flutter_fiap_project2/model/meal.dart';
import 'maps_screen.dart';
import 'package:flutter_fiap_project2/src/tabs_screen.dart';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class WifiScreen extends StatefulWidget {
  @override
  _WifiScreenState createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testes '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                'Clique no botão para testar se está conectado a uma rede. ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              alignment: Alignment.center,
              height: 70,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      ' Checa Conexão ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    splashColor: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      checaInternet();
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                'Clique no botão abaixo para identificar a quantidade de bateria do aparelho. ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              alignment: Alignment.center,
              height: 70,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      ' Checa Bateria ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(10.0),
                    splashColor: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      checabattery();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  checaInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _exibirDialog('Sem internet', 'Conecte o seu celular a uma rede');
    } else if (result == ConnectivityResult.mobile) {
      _exibirDialog('Com internet', 'Você está conectado a rede do celular');
    } else if (result == ConnectivityResult.wifi) {
      _exibirDialog('Com internet', 'Você está conectado a uma rede Wi-fi');
    }
  }



  checabattery() async {

Battery _battery = new Battery(); 

BatteryState _batteryState;
StreamSubscription<BatteryState> _batteryStateSubscription; 

var _batteryvalues = BatteryState.charging;  

  //  print(BatteryState.charging);
  //  print(_batteryvalues);

  // var _batteryState = BatteryState.values;
    if (_batteryvalues == BatteryState.charging) {
      _exibirDialog('Carregando', 'A bateria do aparelho está carregando');
    } else if (_batteryvalues == BatteryState.discharging) {
      _exibirDialog('Bateria', 'A bateria do aparelho está em uso');
    } 
    else if (_batteryvalues == BatteryState.full) {
      _exibirDialog('Bateria Carregada', 'A bateria do aparelho está carregada');
    }




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
      title: Text("Teste se seu device está conectado a internet"),
      content: Text("Não perca a promoção."),
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
