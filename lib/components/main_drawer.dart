import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,   
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          

          Container(
            // height: 160,
            // width: double.infinity,
            padding: EdgeInsets.fromLTRB(12, 30, 12, 5),
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            
            child: Text(
              'Escape Trapp', 
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
                // color: Theme.of(context).accentColor,
              ),
            ),
            
          ),

          
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(12, 5, 12, 20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            
            child: Text(
              'Bora escolher sua próxima aventura ? ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                // color: Theme.of(context).accentColor,
              ),
            ),
            
          ),
          

          SizedBox(height: 20),
          _createItem(
            Icons.landscape,
            'Explorar',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME_APP),
          ),
          _createItem(
            Icons.wifi,
            'Conectividade e Bateria',
            () => Navigator.of(context).pushNamed(AppRoutes.WIFI),
          ),

          _createItem(
            Icons.info_outline,
            'Sobre o App',
            () => Navigator.of(context).pushNamed(AppRoutes.ABOUT),
          ),

          // _createItem(
          //   Icons.contact_mail,
          //   'Testar Push notification Firebase',
          //   () => Navigator.of(context).pushNamed(AppRoutes.PUSH),
          // ),
          // _createItem(
          //   Icons.account_balance_wallet,
          //   'Gastos da Viagem',
          //   () => Navigator.of(context).pushReplacementNamed(AppRoutes.GASTOSPAGE),
          // ),
        ],
      ),
    );
  }
}
