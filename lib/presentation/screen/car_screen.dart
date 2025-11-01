import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MyCarScreen',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
