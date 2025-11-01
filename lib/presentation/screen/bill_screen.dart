import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BilScreen extends StatelessWidget {
  const BilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MyBillScreen',
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
