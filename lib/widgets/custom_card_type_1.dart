import 'package:flutter/material.dart';
import 'package:fl_complements/themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('Titulo'),
            subtitle: Text('Magna ea proident aliqua aliquip.'),
            leading: Icon(
              Icons.padding,
              color: AppTheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ok'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
