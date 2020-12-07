import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import 'package:flutter_fiap_project2/model/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            // child: Text(
            //   // 'Configurações',
            //   style: Theme.of(context).textTheme.title,
            // ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Permitir geolocalização',
                  '',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
