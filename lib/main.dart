import 'package:flutter/material.dart';
import 'package:fl_complements/themes/app_theme.dart';
import 'package:fl_complements/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      // Llamamos a la funcion que hizo el for para que nos muetres todas las pantallas
      routes: AppRoutes.getAppRoutes(),

      // Para una ruta por defecto
      onGenerateRoute: AppRoutes.onGenerateRoute,

      // Definimos el tema de la app
      theme: AppTheme.lightTheme,
    );
  }
}
