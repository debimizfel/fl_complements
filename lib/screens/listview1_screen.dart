import 'package:fl_complements/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);
  final optios = const ['Ajustes', 'Perfil', 'Contactos'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview1Screen'),
      ),
      body: ListView(
        children: [
          /* Operador spred extrae los elementos de la lista*/
          ...optios
              .map(
                (object) => ListTile(
                  title: Text(object),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppTheme.primary,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
