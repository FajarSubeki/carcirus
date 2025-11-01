import 'package:carcirus/core/resources/app_colors.dart';
import 'package:carcirus/data/car_model.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final bool isSelected;
  final VoidCallback onTap;

  const CarCard({
    super.key,
    required this.car,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.gray3,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                car.imagePath,
                width: 200,
                height: 112,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      car.price,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.textSecondary2,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "/week",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.gray2,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              car.description,
              style: TextStyle(
                color: AppColors.gray2,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
