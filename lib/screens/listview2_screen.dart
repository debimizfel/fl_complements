import 'package:fl_complements/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  const Listview2Screen({Key? key}) : super(key: key);
  final optios = const ['Uno', 'Dos', 'Tres', 'Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview2Screen'),
      ),
      body: ListView.separated(
        itemCount: optios.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(optios[i]),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppTheme.primary,
          ),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
