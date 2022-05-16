import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String url;
  final String? title;

  const CustomCardType2({Key? key, required this.url, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
     // Para redondear las tarjetas
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(url),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (title != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(title!),
            )
        ],
      ),
    );
  }
}
