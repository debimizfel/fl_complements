import 'package:fl_complements/themes/app_theme.dart';
import 'package:flutter/material.dart';
class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
