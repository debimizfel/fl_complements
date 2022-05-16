import 'package:fl_complements/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_complements/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOption = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Componentes en Flutter'),
        ),
      ),
      // Este lisvire viene con un separador por defecto
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(menuOption[index].name),
          leading: Icon(
            menuOption[index].icon,
            color: AppTheme.primary,
          ),
          onTap: () {
            // final route = MaterialPageRoute(
            //     builder: (context) => const Listview2Screen());
            // Navigator.push(context, route);

            // Hacemos que al apretar el botón cambie por el nombre de ruta de forma dinámica
            Navigator.pushNamed(context, menuOption[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRoutes.menuOptions.length,
      ),
    );
  }
}
