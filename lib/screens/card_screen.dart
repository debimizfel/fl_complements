import 'package:flutter/material.dart';
import 'package:fl_complements/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            url: 'https://wallpapercave.com/wp/wp6928960.jpg',
            title: 'Paisaje 1',
          ),
          SizedBox(height: 10),
          CustomCardType2(
              url:
                  'https://www.wallpaperup.com/uploads/wallpapers/2018/01/18/1192006/eea1f0f0b30bf675da2b2ec1ee64e7a2-700.jpg'),
          SizedBox(height: 10),
          CustomCardType2(
              url: 'https://images8.alphacoders.com/935/935620.jpg'),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
