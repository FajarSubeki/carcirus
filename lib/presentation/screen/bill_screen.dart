import 'package:flutter/material.dart';

class BilScreen extends StatelessWidget {
  const BilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Widget di tengah layar
        child: Text(
          'MyBillScreen',
          style: TextStyle(
            // Teks diatur menjadi putih
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
