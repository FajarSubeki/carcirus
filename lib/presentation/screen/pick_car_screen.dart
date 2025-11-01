import 'package:carcirus/core/resources/app_asset.dart';
import 'package:carcirus/core/widgets/app_button.dart';
import 'package:carcirus/core/widgets/custom_app_bar.dart';
import 'package:carcirus/data/car_model.dart';
import 'package:carcirus/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class PickCarScreen extends StatefulWidget {
  const PickCarScreen({super.key});

  @override
  State<PickCarScreen> createState() => _PickCarScreenState();
}

class _PickCarScreenState extends State<PickCarScreen> {
  int? selectedIndex;

  final cars = [
    CarModel(
      name: "Economic",
      description: "Nissan Sentra Or Similar",
      price: "\$300",
      imagePath: AppAssets.imgNissanSentra,
    ),
    CarModel(
      name: "Hybrid",
      description: "Toyota Prius Or Similar",
      price: "\$350",
      imagePath: AppAssets.imgToyotaPrius,
    ),
    CarModel(
      name: "SUV",
      description: "Nissan Pathfinder Or Similar",
      price: "\$400",
      imagePath: AppAssets.imgNissanPath,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Pick a Car",
        iconPath: AppAssets.imgBack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return CarCard(
                    car: car,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() => selectedIndex = index);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            AppButton(
              text: 'Book Now',
              enabled: selectedIndex != null,
              onPressed: () {
                if (selectedIndex != null) {
                  final selectedCar = cars[selectedIndex!];
                  Navigator.pop(context, selectedCar);
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
