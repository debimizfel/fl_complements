import 'package:flutter/material.dart';
import 'package:fl_complements/models/models.dart';
import 'package:fl_complements/screens/screens.dart';

class AppRoutes {
  // Ruta inicial - la primera pantalla en ser mostrada
  static const initialRoute = 'home';

/* Se crea un listado de todas las rutas que van a ser llamadas
para mostrarlas de froma rápida*/
  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'lstview2',
      name: 'ListView tipo 2',
      screen: const Listview2Screen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: 'alert',
      name: 'Alertas',
      screen: const AlertScreen(),
      icon: Icons.notifications_active,
    ),
    MenuOption(
      route: 'card',
      name: 'Tarjetas',
      screen: const CardScreen(),
      icon: Icons.credit_card,
    ),
    MenuOption(
      route: 'avatar',
      name: 'Circle Avatar',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animated',
      name: 'Animated Container',
      screen: const AnimatedScreen(),
      icon: Icons.play_circle_outline_rounded,
    ),
     MenuOption(
      route: 'iput',
      name: 'Text inputs',
      screen: const InputScreen(),
      icon: Icons.input_rounded,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': ((context) => const HomeScreen())});

/* Un for para pasar por el listaod de rutas y 
   que muestre las pantallas de froma rápida.*/
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: ((context) => option.screen)});
    }

    return appRoutes;
  }

//Rutas
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': ((context) => const HomeScreen()),
  //   'listview2': ((context) => const Listview2Screen()),
  //   'alert': ((context) => const AlertScreen()),
  //   'card': ((context) => const CardScreen()),
  // };

// Ruta por defecto por si creo una que no existe
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint('$settings');
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
